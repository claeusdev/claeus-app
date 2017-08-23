class Asset < ApplicationRecord
  belongs_to :product

  has_attached_file :image, styles: { medium: "6400x480>", card: "200x200>", thumb: "100x100#" }, default_url: ""
  validates_attachment_content_type :image, content_type: /\Aimage\/.*\z/


end
