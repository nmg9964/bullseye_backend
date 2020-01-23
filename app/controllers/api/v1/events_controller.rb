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
    event = Event.new(event_params)
    admin = event.administrator
    if event.valid?
      event.save
      render json: event
      ClientMailer.confirmation_email(event).deliver_now
      AdminMailer.notification_message(admin).deliver_now
    else
      render json: { error: '500'}
    end
  end

  def update
    event = Event.find(params[:id])
    if event.update(event_params)
      render json: event
    else
      render json: { error: '500' }
    end
  end

  def destroy
    Event.delete(params[:id])
  end

  def find_times
    events = Event.where(date: params[:date])
    events_date = Date.parse(params[:date])
    times = []
    available_times = []
    times = set_times(events_date, times)
    set_available_times(times, events, available_times)
    render json: available_times
  end

  private
  def event_params
    params.require(:event).permit(:date, :time, :first_name, :last_name, :email_address, :phone_number, :guest_count, :message, :administrator_id)
  end

  def set_times(date, times)
    weekday_times = ['12:00 PM', '1:00 PM', '2:00 PM', '3:00 PM', '4:00 PM', '5:00 PM', '6:00 PM', '7:00 PM', '8:00 PM', '9:00 PM']
    weekend_times = weekday_times + ['10:00 PM', '11:00 PM', '12:00 AM']
    date.wday >= 5 ? weekend_times : weekday_times
  end

  def set_available_times(times, events, available_times)
    times.each do |time|
      events_per_hour = events.filter { |event| event.time == time }
      available_times.push(time) if events_per_hour.size < 7
    end
  end

end
