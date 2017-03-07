class RegistrationsController < ApplicationController
  before_action :set_registration, only: [:show, :edit, :update, :destroy]

  def index
    @registrations = policy_scope(Registration).where(participant_id: current_user.id)
  end

  def show
  end

  def new
    @registration = Registration.new
    authorize @registration
  end

  def edit
  end

  def create
    @registration = Registration.new(registration_params)
    @registration.participant_id = current_user.id
    @registration.event_id = params[:event_id]
    authorize @registration

    if @registration.save
      redirect_to @registration, notice: 'Registration was successfully created.'
    else
      render :new
    end
  end

  def update
    if @registration.update(registration_params)
      redirect_to @registration, notice: 'Registration was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    @registration.destroy
    redirect_to registrations_url, notice: 'Registration was successfully destroyed.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_registration
      @registration = Registration.find(params[:id])
      authorize @registration
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def registration_params
      params.require(:registration).permit(:participant_id, :event_id, :status)
    end
end
