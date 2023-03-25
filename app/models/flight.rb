class Flight < ApplicationRecord
  belongs_to :departure_airport, class_name: 'Airport'
  belongs_to :arrival_airport, class_name: 'Airport'
  has_many :bookings, dependent: :destroy

  def formatted_date
    date.strftime('%e %b %Y')
  end

  def formatted_time
    date.strftime('%I:%M %p')
  end

  def formatted_duration
    hour_count = duration / 60
    minute_count = duration % 60
    pluralizable_hour = "hour".pluralize(hour_count)

    if minute_count.zero?
      "#{hour_count} #{pluralizable_hour}"
    else
      "#{hour_count} #{pluralizable_hour} #{minute_count} #{"minute".pluralize(minute_count)}"
    end
  end


  def info
    first_half = "#{formatted_date} | from #{departure_airport.name} at #{formatted_time}"
    second_half = " to #{arrival_airport.name} | duration: #{formatted_duration}"
    first_half + second_half
  end
end
