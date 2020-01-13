class RemoveArrivalCityFromPassengers < ActiveRecord::Migration[5.2]
  def change
    remove_column :passengers, :arrival_city, :string
  end
end
