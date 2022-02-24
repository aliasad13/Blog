class RenamePostIdToBlogId < ActiveRecord::Migration[6.0]
  def change
    rename_column :comments, :post_id, :blog_id
  end
end
