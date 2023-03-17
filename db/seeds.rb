require 'faker'

# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

airport_names_and_codes = [
  %w[Manhattan MHK], %w[Minneapolis MSP], %w[New\ Orleans MSY],
  %w[New\ York NYC], %w[San\ Francisco SFO], %w[Washington\ DC WAS]
]

airport_names_and_codes.each do |item |
  Airport.create!(name: item.first, code: item.last)
end
puts 'created airports'

31.times do |day|
  current_datetime =
    Faker::Time.between_dates(from: Date.today + (day - 1), to: Date.today + day).to_datetime

  airport_names_and_codes.permutation(2) do |departure, arrival|
    Flight.create!(
      date: current_datetime,
      departure_airport: Airport.find_by(code: departure),
      arrival_airport: Airport.find_by(code: arrival),
      duration: rand(45..320)
    )
  end
end
puts 'created flights'
