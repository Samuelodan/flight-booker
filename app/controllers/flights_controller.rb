class FlightsController < ApplicationController
  def index
    @flight_dates = Flight.all.map { |f| [f.formatted_date ,f.date.to_date ] }.uniq
    @airport_options = Airport.all.map { |ap| [ap.name, ap.code] }
    departure_airport = Airport.find_by(code: params[:departure_airport])
    arrival_airport = Airport.find_by(code: params[:arrival_airport])
    @found_flights = Flight.where(
      "DATE(date) = ? AND departure_airport_id = ? AND arrival_airport_id = ?",
      params[:flight_date], departure_airport.id, arrival_airport.id
    )
  end
end
