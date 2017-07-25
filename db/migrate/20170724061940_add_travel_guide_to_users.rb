class AddTravelGuideToUsers < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :travel_guide, :boolean
  end
end
