class CreateJoinTableLanguageUser < ActiveRecord::Migration[5.0]
 def change
    create_table :languages_users, id: false do |t|
      t.integer :language_id
      t.integer :user_id
    end

    add_index :languages_users, :language_id
    add_index :languages_users, :user_id
  end
end
