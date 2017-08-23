class Subcategory < ApplicationRecord
  belongs_to :category
  has_many :products

  extend FriendlyId
  friendly_id :name, use: :slugged
end
