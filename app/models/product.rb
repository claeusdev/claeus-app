class Product < ApplicationRecord
  extend FriendlyId
  friendly_id :name, use: :slugged
  
  mount_uploader :image, AvatarUploader

  belongs_to :store
  belongs_to :subcategory

  has_many :assets, dependent: :destroy
  has_many :likes, as: :likeable, dependent: :destroy
  has_many :comments, dependent: :destroy
  
  validates :name, :description, :price, presence: true
  validates :price, numericality: true
  validates :image, presence: true

  has_one :line_item, dependent: :destroy
  accepts_nested_attributes_for :assets, :allow_destroy => true

  before_save :round_price
  belongs_to :order, optional: true

  paginates_per 25

  # before_destroy :ensure_not_referenced_by_any_line_item

  private

  def round_price
    price.round
  end
end
