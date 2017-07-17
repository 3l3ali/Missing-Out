class CreateReviews < ActiveRecord::Migration[5.0]
  def change
    create_table :reviews do |t|
      t.references :user, foreign_key: true
      t.references :post, foreign_key: true
      t.text :description
      t.integer :stars

      t.timestamps
    end
  end
end
