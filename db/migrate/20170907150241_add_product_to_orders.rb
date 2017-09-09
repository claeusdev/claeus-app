class AddProductToOrders < ActiveRecord::Migration[5.1]
  def change
    add_reference :orders, :product, foreign_key: true
  end
end
