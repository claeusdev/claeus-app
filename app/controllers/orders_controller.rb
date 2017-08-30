class OrdersController < ApplicationController
	before_action :authenticate_user!
	
	def new
		@order = Order.new
	end

	def create
		if params[:product_id]
			product = Product.find(params[:product_id])
			@store = product.store
			@order = Order.new(order_params)
		end
		
	end

	def checkout
		
	end

	private

	def order_params
		params.require(:order).permit(:name, :phone, :address, :quantity, :user_id, :product_id, :store_id)
	end
end
