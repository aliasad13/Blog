class ChangeDataTypeForContent < ActiveRecord::Migration[6.0]
  def change
    change_column(:blogs, :content, :text)
  end
end
