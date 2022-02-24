class AddDescToBlogs < ActiveRecord::Migration[6.0]
  def change
    add_column :blogs, :desc, :string
  end
end
