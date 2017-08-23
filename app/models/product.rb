class Product < ApplicationRecord
  extend FriendlyId
  friendly_id :name, use: :slugged
  
  has_attached_file :image, styles: { medium: "400x400>", card: "200x200>", thumb: "100x100>" }, default_url: "/images/:style/missing.png"
  validates_attachment_content_type :image, content_type: /\Aimage\/.*\z/

  belongs_to :store
  belongs_to :subcategory
  has_many :assets, dependent: :destroy
  has_many :likes, as: :likeable, dependent: :destroy
  validates :name, :description, :price, presence: true
  validates :price, numericality: true
  validates :image, presence: true

  accepts_nested_attributes_for :assets, :allow_destroy => true

  before_save :round_price

  private

  def round_price
    price.round
  end

end
