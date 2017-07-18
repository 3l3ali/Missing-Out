class AddRecommendedToReviews < ActiveRecord::Migration[5.0]
  def change
    add_column :reviews, :recommended, :boolean
  end
end
