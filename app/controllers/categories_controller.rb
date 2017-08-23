class CategoriesController < ApplicationController
	before_action :set_cat, only: [:show, :edit, :update, :destroy]

	def index
		@categories = Category.all
	end

	def show  
		@subcategories = Subcategory.where(category_id: @category)
	end

	def new
		@category = Category.new
	end

	
	def create
		@category = Category.new(category_params)
		if @category.save
			redirect_to @category, notice: "Category added!"
		else
			render "new"
		end
	end


	private
	def set_cat
		@category = Category.friendly.find(params[:id])
	end
	def category_params
		params.require(:category).permit(:name, :parent_id, :avatar)
	end
end