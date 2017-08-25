class Cart < ApplicationRecord
	has_many :line_items, dependent: :destroy
	def item_count
		0
	end
end
