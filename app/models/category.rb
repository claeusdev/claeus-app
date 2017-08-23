class Category < ApplicationRecord
  

  has_attached_file :avatar, styles: { medium: "400x400>", card: "200x200>", thumb: "100x100>" }, default_url: "/images/:style/missing.png"
	validates_attachment_content_type :avatar, content_type: /\Aimage\/.*\z/

  has_many :stores, dependent: :destroy
  has_many :subcategories
  has_many :likes, as: :likeable, dependent: :destroy
  validates :name, presence: true, uniqueness: true 
  validates :avatar, presence: true

  extend FriendlyId
  friendly_id :name, use: :slugged

end
