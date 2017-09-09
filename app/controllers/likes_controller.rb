class LikesController < ApplicationController
	before_action :authenticate_user!, only: [:toggle]

	def toggle
		if params[:product_id]
			likeable = Product.find(params[:product_id])
			@store = likeable.store			
		elsif params[:category_id]
			likeable = Category.find(params[:category_id])			
		end

		current_user.toggle_like!(likeable)
		if current_user.likes!(likeable)
	    Notification.create(recipient: @store, actor: current_user, action: " liked your ", notifiable: likeable )
	  else
	    Notification.create(recipient: @store, actor: current_user, action: " no longer likes your ", notifiable: likeable )
		end

		redirect_back fallback_location: likeable
	end
end
