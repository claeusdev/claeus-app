class OrdersController < ApplicationController
	def create
		@order = Order.new(order_params)
		@order.line_items = get_cart.line_items
		if @order.save!
			flash[:success] = 'Thanks for your order'
			destroy_cart

			@order.line_items.each do |line|
				@store = line.product.store
				Notification.create(recipient: @store, actor: current_user, action: " placed an ", notifiable: @order )
			end
			redirect_to root_path
		else
			flash[:error] = @order.errors.full_messages.to_sentence
		end



	end

	private

	def order_params
		params.require(:order).permit(:name, :phone, :address)
	end
end
