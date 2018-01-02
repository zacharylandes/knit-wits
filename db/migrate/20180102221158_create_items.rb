class CreateItems < ActiveRecord::Migration[5.1]
  def change
    create_table :items do |t|
      t.string :title
      t.string :description
      t.decimal :price, precision: 8, scale: 2
      t.string :image
      t.integer :category_id
    end
  end
end
