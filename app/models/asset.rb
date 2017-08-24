class Asset < ApplicationRecord
  belongs_to :product

  mount_uploader :image, AvatarUploader
end
