class CalendarController < ApplicationController
  
  def index
    @month = (params[:month] || (Time.zone || Time).now.month).to_i
    @year = (params[:year] || (Time.zone || Time).now.year).to_i
    @room = (params[:room] || Booking.first.room_id).to_i

    @shown_month = Date.civil(@year, @month)

    # @event_strips = Booking.event_strips_for_month(@shown_month)
    @event_strips = Room.find(@room).booking.event_strips_for_month(@shown_month)
  end
  
end
