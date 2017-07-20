class RemoveNameFromLocations < ActiveRecord::Migration[5.0]
  def change
    remove_column :locations, :name
  end
end
