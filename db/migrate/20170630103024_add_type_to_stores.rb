class AddTypeToStores < ActiveRecord::Migration[5.1]
  def change
    add_column :stores, :store_type, :string
  end
end
