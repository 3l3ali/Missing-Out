class CreateFollows < ActiveRecord::Migration[5.0]
  def change
    create_table :follows do |t|
      t.integer :followed_id
      t.integer :follower_id

      t.timestamps
    end
  end
end
