class Order < ApplicationRecord
  belongs_to :product
  belongs_to :store
  belongs_to :user
end
