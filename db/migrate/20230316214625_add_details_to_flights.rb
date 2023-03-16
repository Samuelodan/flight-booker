class AddDetailsToFlights < ActiveRecord::Migration[7.0]
  def change
    add_column :flights, :duration, :bigint
  end
end
