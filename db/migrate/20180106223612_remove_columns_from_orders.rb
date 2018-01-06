class RemoveColumnsFromOrders < ActiveRecord::Migration[5.1]
  def change
    remove_column :orders, :street
    remove_column :orders, :city
    remove_column :orders, :state
    remove_column :orders, :zipcode
  end
end
