class RemoveParentColumn < ActiveRecord::Migration[5.0]
  def change
    remove_column :comments, :parent_comment_id
  end
end
