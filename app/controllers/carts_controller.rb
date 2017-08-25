class CartsController < ApplicationController
	def add
		@cart = get_cart
		# @line_item = LineItem.new (line_item_params)
		# @line_item.cart = @cart
		line_item = @cart.line_items.build(line_item_params)
		@product = Product.where(product_id: :product_id)
		if line_item.save
			flash[:success] = "Added to cart succesfully."
		else
			flash[:error] = "Can't add #{line_item.product.name}, Errors: #{line_item.errors.full_messages.to_sentence}"
		end
		redirect_back fallback_location: @product

	end


	private

	def line_item_params
		params.require(:line_item).permit(:product_id, :quantity)
	end
end