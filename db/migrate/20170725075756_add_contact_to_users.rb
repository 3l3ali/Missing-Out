class AddContactToUsers < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :contact, :text
  end
end
