class AddSubcategoriesToProducts < ActiveRecord::Migration[5.1]
  def change
    add_reference :products, :subcategory, foreign_key: true
  end
end
