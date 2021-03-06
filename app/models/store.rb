class Store < ApplicationRecord
  mount_uploader :avatar, AvatarUploader

  RESTRICTED_NAMES = %w[www]
  extend FriendlyId
  friendly_id :name, use: :slugged
  
  belongs_to :user, dependent: :destroy
  belongs_to :category, dependent: :destroy

  has_many :notifications, foreign_key: :recipient_id
  has_many :products, dependent: :destroy
  has_many :followings, dependent: :destroy
  has_many :followers, through: :followings
  has_many :orders, dependent: :destroy
  

  STORE_TYPES = ["Retailer", "Wholesaler", "Manufacturer"]

  validates :name, presence: true,
                  uniqueness: { case_sensitive: false},
                  format: { with: /\A[\w\-]+\Z/i, message: 'contains invalid characters'},
                  exclusion: { in: RESTRICTED_NAMES, message: 'restricted'}
  validates :description, presence: true
  validates :store_type, presence: true, inclusion: { in: STORE_TYPES }
  validates :category, presence: true

 

end
