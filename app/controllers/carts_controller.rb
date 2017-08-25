class CartsController < ApplicationController

	def add
		@cart = get_cart
		@product = Product.where(id: :product_id)
		line_item = @cart.line_items.build(line_item_params)
		unless line_item.save
			flash[:error] = "Could not add #{@product.name}, #{line_item.errors.full_messages.to_sentence }"
		end
		redirect_back fallback_location: @product
	end


	def show
		@cart = get_cart
	end



	private

	def line_item_params
		params.require(:line_item).permit(:product_id, :quantity)
	end
end
