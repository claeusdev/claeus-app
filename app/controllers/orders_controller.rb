class OrdersController < ApplicationController
	def create
		if params[:product_id]
			@product = Product.find(params[:product_id])
			@store = @product.store
		end
		@order = Order.new order_params
		@order.user = current_user
		@order.store = @store

		if @order.save
			flash[:success] = 'Thanks for your order'
			redirect_to order_path
		else
			flash[:error] = @order.errors.full_messages.to_sentence
		end
	end

	private

	def order_params
		params.require(:order).permit(:store_id, :product_id, :quantity)
	end
end
