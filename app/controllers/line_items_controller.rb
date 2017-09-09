class LineItemsController < ApplicationController
	before_action :set_line_item, only: [:show, :edit, :update, :destroy]

	def create
		@product = Product.find(params[:product_id])
		@order = Order.new
		@line_item = @order.line_item.build(product: @product)
		respond_to do |format|
			if @line_item.save
				format.html { redirect_to @line_item.order,
				notice: 'Line item was successfully created.' }
				format.json { render :show,
				status: :created, location: @line_item }
			else
				format.html { render :new }
				format.json { render json: @line_item.errors,
				status: :unprocessable_entity }
			end
		end
	end


	private

	def set_line_item
		@line_item = LineItem.find(params[:id])
	end
end
