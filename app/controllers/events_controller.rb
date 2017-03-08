class EventsController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index, :show, :search]
  skip_after_action :verify_authorized, only: [:index, :show, :search]
  after_action :verify_policy_scoped, only: [:index], unless: :skip_pundit?

  before_action :set_event, only: [:show, :edit, :update, :destroy]

  def search
    @event = Event.new
    session[:search_results] = params[:address]
    @events = policy_scope(Event)

    if params[:event][:tags].present?
      tags_list = params[:event][:tags].select { |i| i.present? }

      @events = @events.where("tags @> ?", "{#{tags_list.join(",")}}")

    else
      @events = @events.all
    end

    if params[:event][:address].present?
      @events = @events.where("address ILIKE ?", "%#{params[:event][:address]}%") # ILIKE ne prend pas en compte la casse
    end

    @events = @events.where('start_time >= ?', Date.today).order(start_time: :asc)
               # .paginate(:per_page => 10, :page => params[:page])
  end






# def update
#         @cart = current_cart
#         @cart_item = @cart.cart_items.find_by(product_id: params[:id])
#         if @cart_item.product.storage >= cart_item_params[:quantity].to_i
#             @cart_item.update(cart_item_params)
#             redirect_to carts_path
#         else
#             redirect_to carts_path, alert: "exceed the storage"
#         end

# end





  def my_events

  end

  def show
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
