class BookingsController < ApplicationController
  def new
    @booking = Booking.new
    @flight = Flight.find(params[:selected_flight_id])
    @passenger_count = params[:no_of_passengers].to_i
    @passenger_count.times { @booking.passengers.build }
  end
end
