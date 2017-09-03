class SubcategoriesController < ApplicationController
	before_action :set_cat, only: [:show, :edit, :update, :destroy]
	def index
		@subcategories = Subcategory.all
	end

	def show  
	end

	def new
		@subcategory = Subcategory.new
	end

	
	def create
		@subcategory = Subcategory.new(category_params)
		if @subcategory.save
			redirect_to @subcategory, success: "Subcategory added!"
		else
			render "new"
		end
	end


	private

	def set_cat
		@subcategory = Subcategory.friendly.find(params[:id])
	end

	def category_params
		params.require(:subcategory).permit(:name, :category_id, :avatar)
	end

end
