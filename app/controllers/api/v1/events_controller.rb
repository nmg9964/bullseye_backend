class Api::V1::EventsController < ApplicationController
  def index
    events = Event.all 
    render json: events
  end

  def show
    event = Event.find(params[:id])
    render json: event
  end

  def create
    event = Event.create(event_params)
    render json: event
  end

  def destroy
    Event.delete(params[:id])
  end


  private
  def event_params
    params.require(:event).permit(:date, :first_name, :last_name, :email_address, :phone_number, :guest_count, :message, :administrator_id)
  end

end
