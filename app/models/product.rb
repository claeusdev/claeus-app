class Product < ApplicationRecord
  extend FriendlyId
  friendly_id :name, use: :slugged
  
  mount_uploader :image, AvatarUploader

  belongs_to :store
  belongs_to :subcategory
  has_many :assets, dependent: :destroy
  has_many :likes, as: :likeable, dependent: :destroy
  validates :name, :description, :price, presence: true
  validates :price, numericality: true
  validates :image, presence: true

  has_many :line_items, dependent: :destroy
  accepts_nested_attributes_for :assets, :allow_destroy => true

  before_save :round_price

  private

  def round_price
    price.round
  end

end
