class RemoveTimeFromPassengers < ActiveRecord::Migration[5.2]
  def change
    remove_column :passengers, :time, :string
  end
end
