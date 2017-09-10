class CommentsController < ApplicationController
	def create
		@product = Product.friendly.find(params[:product_id])
		@comment = @product.comments.create(comment_params)
		@comment.user = current_user

		if @comment.save
			respond_to do |format|
				format.js 
				format.html { redirect_to store_product_path(@product.store, @product), notice: "Thanks for your response"}
			end
		else
			flash.alert = "Post could not be created."
			redirect_to store_product_path(@product.store, @product)
		end
	end


	private

	def comment_params
		params.require(:comment).permit(:body, :product_id, :user_id)
	end
end
