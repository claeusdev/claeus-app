class CreateLikes < ActiveRecord::Migration[5.1]
  def change
    create_table :likes do |t|
      t.belongs_to :user, foreign_key: true
      t.integer :likeable_id
      t.string :likeable_type

      t.timestamps
    end
  end
end
