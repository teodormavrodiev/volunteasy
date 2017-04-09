class EventsController < ApplicationController
  skip_before_action :authenticate_user!, only: [:show, :search, :new, :create, :cool_form]


  skip_after_action :verify_authorized, only: [:show, :search]
  after_action :verify_policy_scoped, only: [:search], unless: :skip_pundit?

  before_action :set_event, only: [:show, :edit, :update, :destroy, :users]

  def search
    @event = Event.new
    session[:search_results] = params[:address]
    @events = policy_scope(Event)

    unless params[:event].nil? || params[:event][:tags].blank?
      tags_list = params[:event][:tags].select { |i| i.present? }
      @events = @events.including_tags(tags_list)
    end

    @address = params[:event][:address] if params[:event]

    unless params[:event].nil? || @address.blank?
      # What is that?
      @events = @events.where("address ILIKE ?", "%#{@address}%")
    end
  end


  def my_events
    @user = current_user
    authorize @user

    @past_events_attended = past_events_attendee(@user)
    @current_events_attended = current_events_attendee(@user)
    @past_events_managed = past_events_manager(@user)
    @current_events_managed = current_events_manager(@user)
  end


  def users
    @event_users = @event.participants.all
  end

  def show
    @event_is_past = @event.end_time < DateTime.now ? true : false
    if current_user
      @organizer_is_user = @event.organizer_id == current_user.id ? true : false
    end
    @spots_left = @event.capacity - @event.participants.count
    @spots_left = 0 if @spots_left < 0
    @tags_list = @event.tags
    @participants = @event.participants

    @hash = Gmaps4rails.build_markers(@event) do |event, marker|
      if event.latitude
        marker.lat event.latitude
        marker.lng event.longitude
      else
        marker.lat '29.9792345'
        marker.lng '31.1320132'
      end
      # marker.infowindow render_to_string(partial: "/flats/map_box", locals: { flat: flat })
    end

  end

  def new
    @event = Event.new
    authorize @event
    session[:search_results] = params[:address]
    @events = policy_scope(Event)
    @address = params[:event][:address] if params[:event]
  end

  def edit
  end

  def create
    @event = Event.new(event_params)
    @event.start_time = DateTime.parse(params[:event][:start_day] + ' ' + params[:event][:start_time])
    @event.end_time = DateTime.parse(params[:event][:end_day] + ' ' + params[:event][:end_time])

    authorize @event

    if current_user
      @event.organizer_id = current_user.id
      if @event.save
        redirect_to @event, notice: 'Event was successfully created.'
      else
        redirect_to cool_form_path(1), notice: @event.errors.messages
      end
    else
      @event.organizer_id = 0
      user = User.find_by(id: 0)
      user = User.create(id: 0, first_name: "placehold", last_name: "placehold", email: "testaa@test.com", password: "testtest" ) unless user
      if @event.save
        cookies[:event_id] = @event.id
        cookies[:participant] = "false"
        redirect_to new_user_session_path
      else
        redirect_to cool_form_path(1), notice: @event.errors.messages
      end
    end
  end

  def update
    if @event.update(event_params)
      redirect_to @event, notice: 'Event was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    @event.destroy
    redirect_to user_events_path, notice: 'Event was successfully destroyed.'
  end


  def cool_form
    number = params[:number]
    case number
    when "1"
      @event = Event.new
      @event.start_time = 2.days.from_now
      @event.end_time = 2.days.from_now
      authorize @event
    when "2"
      fill_cool_form
      @event.start_time = DateTime.parse(params[:event][:start_day] + ' ' + params[:event][:start_time])
      @event.end_time = DateTime.parse(params[:event][:end_day] + ' ' + params[:event][:end_time])
    when "3"
      fill_cool_form
      @event.start_time = DateTime.parse(params[:event][:start_day] + ' ' + params[:event][:start_time])
      @event.end_time = DateTime.parse(params[:event][:end_day] + ' ' + params[:event][:end_time])
    end
  end

  def cool_form_edit
    number = params[:number]
    case number
    when "1"
      set_event
    when "2"
      fill_cool_edit_form
      @event.start_time = DateTime.parse(params[:event][:start_day] + ' ' + params[:event][:start_time])
      @event.end_time = DateTime.parse(params[:event][:end_day] + ' ' + params[:event][:end_time])
    when "3"
      set_event
      @event.start_time = DateTime.parse(params[:event][:start_day] + ' ' + params[:event][:start_time])
      @event.end_time = DateTime.parse(params[:event][:end_day] + ' ' + params[:event][:end_time])
      begin
        event_params
        unless @event.update(event_params)
          respond_to do |format|
            flash.now[:error] = 'It did not work'
            format.js {render inline: "location.reload();", notice: @event.errors.messages }
          end
        end
      rescue ActionController::ParameterMissing
      end
    when "4"
      fill_cool_edit_form
      redirect_to @event, notice: 'Event was successfully updated.'
    end
  end

  private

  def fill_cool_form
    @event = Event.new(event_params)
    authorize @event
  end

  def fill_cool_edit_form
    set_event
    unless @event.update(event_params)
      respond_to do |format|
        flash.now[:error] = 'It did not work'
        format.js {render inline: "location.reload();", notice: @event.errors.messages }
      end
    end
  end

  def set_event
    @event = Event.find(params[:id])
    authorize @event
  end

  def event_params
    params.require(:event).permit(:name, :organization, :start_time, :end_time, :address, :capacity, :description, :source_event_id, photos: [], tags: [])
  end

  def past_events_manager(user)
    user.events.where("end_time < ?", DateTime.now)
  end

  def current_events_manager(user)
    user.events.where("end_time > ?", DateTime.now)
  end

  def past_events_attendee(user)
    user.events_as_participant.where("end_time < ?", DateTime.now)
  end

  def current_events_attendee(user)
    user.events_as_participant.where("end_time > ?", DateTime.now)
  end


end

