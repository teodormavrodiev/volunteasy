class EventsController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index, :show]
  skip_after_action :verify_authorized, only: [:index, :show]
  after_action :verify_policy_scoped, only: [:index, :show], unless: :skip_pundit?

  before_action :set_event, only: [:show, :edit, :update, :destroy]

  def index
    @events = policy_scope(Event)

    if params[:tag].present?
      tag_list = params[:tag]
      @events = @events.where("tag @> ?", "{#{tag_list.join(",")}}")
    else
      @events = @events.all
    end

    if params[:address].present?
      @events = @events.where("address ILIKE ?", params[:address]) # ILIKE ne prend pas en compte la casse
    end

    @events = @events.order(start_time: :desc)
  end

  def show
    @attending = @event.participants.all
    tag_list = @event.tag
    @similar_events = Event.where("tag @> ?", "{#{tag_list.join(",")}}")
  end

  def new
    @event = Event.new
    authorize @event
  end

  def edit
  end

  def create
    @event = Event.new(event_params)
    @event.organizer_id = current_user.id
    authorize @event

    if @event.save
      redirect_to @event, notice: 'Event was successfully created.'
    else
      render :new
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
      params.require(:event).permit(:name, :organization, :start_time, :end_time, :address, :capacity, :tags, :source_event_id, photos: [])
    end
end
