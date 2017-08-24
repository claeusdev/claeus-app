class OrdersController < ApplicationController
	before_action :find_model

	

	private
	def find_model
		@model = Order.find(params[:id]) if params[:id]
	end
end