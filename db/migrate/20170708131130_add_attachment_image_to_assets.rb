class AddAttachmentImageToAssets < ActiveRecord::Migration[5.1]
  def self.up
    change_table :assets do |t|
      t.attachment :image
    end
  end

  def self.down
    remove_attachment :assets, :image
  end
end
