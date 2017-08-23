class NotificationsController < ApplicationController
	before_action :authenticate_user!
	def index
		@notifications = Notification.where(recipient: current_user.store).unread
		@store = current_user.store
	end

	def mark_as_read
		@store = current_user.store
		@notifications = Notification.where(recipient: @store).unread
		@notifications.update_all(read_at: Time.zone.now)
		render json: { success: true }
	end
	
end