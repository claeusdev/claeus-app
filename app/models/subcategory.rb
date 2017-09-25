class Subcategory < ApplicationRecord
  mount_uploader :avatar, AvatarUploader

  belongs_to :category, dependent: :destroy
  has_many :products, dependent: :destroy

  extend FriendlyId
  friendly_id :name, use: :slugged
end
