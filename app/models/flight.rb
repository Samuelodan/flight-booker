class Flight < ApplicationRecord
  belongs_to :departure_airport, class_name: 'Airport'
  belongs_to :arrival_airport, class_name: 'Airport'

  def formatted_date
    date.strftime('%e %b %Y')
  end

  def formatted_time
    date.strftime('%I:%M %p')
  end
end
