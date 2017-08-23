class Store < ApplicationRecord
  has_attached_file :logo, styles: { thumb: "100x100>" }, default_url: "/images/:style/missing.png"
  validates_attachment_content_type :logo, content_type: /\Aimage\/.*\z/


  RESTRICTED_NAMES = %w[www]
  extend FriendlyId
  friendly_id :name, use: :slugged
  
  belongs_to :user
  belongs_to :category

  has_many :notifications, foreign_key: :recipient_id
  has_many :products
  has_many :followings
  has_many :followers, through: :followings


  STORE_TYPES = ["Retailer", "Wholesaler", "Manufacturer"]

  validates :name, presence: true,
                  uniqueness: { case_sensitive: false},
                  format: { with: /\A[\w\-]+\Z/i, message: 'contains invalid characters'},
                  exclusion: { in: RESTRICTED_NAMES, message: 'restricted'}
  validates :description, presence: true
  validates :store_type, presence: true, inclusion: { in: STORE_TYPES }
  validates :category, presence: true


end
