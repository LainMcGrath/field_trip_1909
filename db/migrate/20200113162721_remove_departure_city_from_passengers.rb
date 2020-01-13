class RemoveDepartureCityFromPassengers < ActiveRecord::Migration[5.2]
  def change
    remove_column :passengers, :departure_city, :string
  end
end
