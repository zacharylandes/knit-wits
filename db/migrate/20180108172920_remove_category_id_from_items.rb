class RemoveCategoryIdFromItems < ActiveRecord::Migration[5.1]
  def change
    remove_column :items, :category_id
  end
end
