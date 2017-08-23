class AddAttachmentLogoToStores < ActiveRecord::Migration[5.1]
  def self.up
    change_table :stores do |t|
      t.attachment :logo
    end
  end

  def self.down
    remove_attachment :stores, :logo
  end
end
