class RemoveStarsFromReviews < ActiveRecord::Migration[5.0]
  def change
    remove_column :reviews, :stars, :integer
  end
end
