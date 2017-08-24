class Category < ApplicationRecord
  mount_uploader :avatar, AvatarUploader

  has_many :stores, dependent: :destroy
  has_many :subcategories
  has_many :likes, as: :likeable, dependent: :destroy
  validates :name, presence: true, uniqueness: true 
  validates :avatar, presence: true

  extend FriendlyId
  friendly_id :name, use: :slugged

end
