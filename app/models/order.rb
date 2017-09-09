class Order < ApplicationRecord
	has_one :product, dependent: :destroy
	belongs_to :store
end
