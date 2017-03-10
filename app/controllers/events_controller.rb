class EventsController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index, :show, :search, :new, :create]


  skip_after_action :verify_authorized, only: [:index, :show, :search]
  skip_after_action :verify_authorized, except: [:destroy] # (For now)
  after_action :verify_policy_scoped, only: [:index], unless: :skip_pundit?

  before_action :set_event, only: [:show, :edit, :update, :destroy, :users]

  def search
    @event = Event.new
    session[:search_results] = params[:address]
    @events = policy_scope(Event)

    unless params[:event].nil? || params[:event][:tags].blank?
      tags_list = params[:event][:tags].select { |i| i.present? }
      @events = @events.including_tags(tags_list)
      # (Juliette) Show only non full events : right now we will show all events and display full for full events.
      # We'll try to find the query to display only non full events.
      # @non_full_events = @events.where('capacity > ?', participants.count)
    end

    @address = params[:event][:address] if params[:event]

    unless params[:event].nil? || @address.blank?
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
  #     juliette's push
  #     @attending = @event.participants.all
  #     tags_list = @event.tags
  #     @similar_events = Event.where("tags @> ?", "{#{tags_list.join(",")}}")
      @participants = @event.participants.all

      # Spots Left
      if (@event.capacity - @event.participants.size) <= 0
        @spots_left = 0
      else
        @spots_left = @event.capacity - @event.participants.size
      end


      @organizer_name = @event.organizer.first_name << " " << @event.organizer.last_name

      # @registration = Registration.where(participant_id: current_user.id).where(event_id: @event.id)

      # Tagging
      tags_list = @event.tags
      @similar_events = Event.where("tags @> ?", "{#{tags_list.join(",")}}")
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
      user = User.find(0)
      user = User.create(first_name: "placehold", last_name: "placehold", email: "test@test.com", password: "testtest" ) unless user
      if @event.save
        cookies[:event_id] = @event.id
        cookies[:participant] = false
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
    redirect_to events_url, notice: 'Event was successfully destroyed.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
  def set_event
    @event = Event.find(params[:id])
    authorize @event
  end

  # Never trust parameters from the scary internet, only allow the white list through.
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

