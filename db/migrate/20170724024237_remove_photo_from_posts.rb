class RemovePhotoFromPosts < ActiveRecord::Migration[5.0]
  def change
    remove_column :posts, :photo
  end
end
