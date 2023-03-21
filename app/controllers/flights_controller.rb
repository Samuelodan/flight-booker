class FlightsController < ApplicationController
  def index
    @flight_dates = Flight.all.map { |f| [f.formatted_date ,f.date.to_date ] }.uniq
  end
end
