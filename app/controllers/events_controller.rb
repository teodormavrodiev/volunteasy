class EventsController < ApplicationController
  skip_before_action :authenticate_user!, only: [:show, :search, :new, :create]


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
    @participants = @event.participants.all

    if (@event.capacity - @event.participants.size) <= 0
      @spots_left = 0
    else
      @spots_left = @event.capacity - @event.participants.size
    end

    @organizer_name = @event.organizer.first_name << " " << @event.organizer.last_name

    tags_list = @event.tags
    @similar_events = Event.where("tags @> ?", "{#{tags_list.join(",")}}")


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
  end

  def edit
  end

  def create
    @event = Event.new(event_params)
    if current_user
      @event.organizer_id = current_user.id
      authorize @event
      if @event.save
        redirect_to @event, notice: 'Event was successfully created.'
      else
        render :new
      end
    else
      @event.organizer_id = 0
      authorize @event
      user = User.find_by(id: 0)
      user = User.create(id: 0, first_name: "placehold", last_name: "placehold", email: "testaa@test.com", password: "testtest" ) unless user
      if @event.save
        cookies[:event_id] = @event.id
        cookies[:participant] = "false"
        redirect_to new_user_session_path
      else
        render :new
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


  private

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

