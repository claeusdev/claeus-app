class CreateFollowings < ActiveRecord::Migration[5.1]
  def change
    create_table :followings do |t|
      t.belongs_to :follower
      t.belongs_to :store, foreign_key: true

      t.timestamps
    end
  end
end
