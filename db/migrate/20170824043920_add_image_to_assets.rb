class AddImageToAssets < ActiveRecord::Migration[5.1]
  def change
    add_column :assets, :image, :string
  end
end
