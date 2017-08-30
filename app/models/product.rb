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

  paginates_per 25

  before_destroy :ensure_not_referenced_by_any_line_item

  private

  def round_price
    price.round
  end

  def ensure_not_referenced_by_any_line_item
    unless line_items.empty?
      errors.add(:base, 'Line Items present')
      throw :abort
    end
  end

end
