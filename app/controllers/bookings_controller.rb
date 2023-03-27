class BookingsController < ApplicationController
  def new
    @booking = Booking.new
    @flight = Flight.find(params[:selected_flight_id])
    @passenger_count = params[:no_of_passengers].to_i
    @passenger_count.times { @booking.passengers.build }
  end

  def create
    @booking = Booking.new(booking_params)

    if @booking.save
      redirect_to @booking, notice: "Booking Created Successfully!"
    else
      render :new, status: :unprocessable_entity
    end
  end

  def show
    @booking = Booking.find(params[:id])
  end

  def booking_params
    params.require(:booking).permit(:flight_id, passengers_attributes: [:name, :email])
  end
end
