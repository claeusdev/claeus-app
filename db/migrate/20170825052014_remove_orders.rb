class RemoveOrders < ActiveRecord::Migration[5.1]
  def change
  	drop_table :orders do |t|

      t.timestamps
    end
  end
end
