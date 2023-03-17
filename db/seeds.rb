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
