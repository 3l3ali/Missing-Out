class AddUserToLanguages < ActiveRecord::Migration[5.0]
  def change
    add_reference :languages, :user, foreign_key: true
  end
end
