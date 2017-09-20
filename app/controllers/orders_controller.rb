class OrdersController < ApplicationController
	before_action :set_product, only: [:new, :create]

	def index
		
	end
	
	def new
		@order = Order.new
	end

	def show
		
	end

	def create
		@order = Order.new(order_params)
		@order.product_id = @product
		@order.store_id = @product.store
		if @order.save
			redirect_to @order
			format.json
		else
			render :new
		end
	end

	private

	def set_product
		@product = Product.friendly.find(params[:product_id])
	end


	def order_params
		params.require(:order).permit(:name, :email, :phone, :address, :store_id, :product_id, :quantity)
	end
end
