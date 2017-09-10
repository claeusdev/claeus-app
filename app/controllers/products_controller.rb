class ProductsController < ApplicationController
	before_action :set_product, only: [:edit, :update, :destroy]
	before_action :authenticate_user!, except: :show
	def show
		set_product
		@order = Order.new
		@comments = Comment.where(product: @product).order('created_at ASC')
	end 

	def buy
		@product = Product.friendly.find(params[:product_id])
	end

	def index
		@store = Store.friendly.find(params[:store_id])
		@products = @store.products
	end

	def new
		@store = current_user.store
		@product = Product.new
		4.times { @product.assets.build }
	end

	def edit
		@store = Store.friendly.find(params[:store_id])
		4.times { @product.assets.build }
	end

	def create
		@product = Product.new(product_params)
		@product.store_id = current_user.store.id

		if @product.save
			 redirect_to store_dashboard_url(@product.store), notice: "Product added successfully"
		else
			 render 'new'
		end

	end

	def update
		respond_to do |format|
			if @product.update(product_params)
					format.html { redirect_to store_product_path([@store]), notice: 'Product was successfully updated.' }
					format.json { render :show, status: :ok, location: @product }
			else
					format.html { render :edit }
					format.json { render json: @product.errors, status: :unprocessable_entity }
			end
		end
	end

	def destroy
		set_store
		@product.destroy

		respond_to do |format|
			if @product.destroy
				format.html { redirect_to store_products_path, notice: 'Product Successfully deleted!!'}
			end
		end
	end

	private

	def set_store
		@store = Store.friendly.find(params[:store_id])
	end

	def set_product
		set_store
	 	@product = @store.products.friendly.find(params[:id])
	end

	def product_params
		 params.require(:product).permit(:name, :description, :price, :store_id, :image, :category_id, :subcategory_id, assets_attributes: [:image])
	end
end
