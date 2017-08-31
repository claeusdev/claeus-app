class Order < ApplicationRecord
	enum payment_type: {
		"Debit Card"=> 0,
		"Credit Card"=> 1
	}

	validates :name, :address, :email, presence: true
	validates :payment_type, inclusion: payment_types.keys


	has_many :line_items


	def add_line_items_from_cart(cart)
		cart.line_items.each do |item|
			item.cart_id = nil
			line_items << item
		end
	end


	# Find every store from the order list

	def notify_store(order, user)
		order.line_items.each do |o|
			@product = o.product
		 	@store = o.product.store
		end
    Notification.create(recipient: @store, actor: user, action: " ordered your ", notifiable: @product )
	end
end
