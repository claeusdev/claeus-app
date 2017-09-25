class StoresController < ApplicationController
	before_action :find_store, only: [:show, :update, :destroy]
	before_action :authenticate_user!, except: [:show]

	def index
		
	end
	def new
		@store = Store.new
	end

	def dashboard
		@store = Store.friendly.find(params[:store_id])
		@products = @store.products.order(created_at: "DESC").limit(5)
		# @orders = Order.where()
	end

	def show
		@store = Store.friendly.find(params[:id])
		@products = @store.products
		@meta_description = "#{@store.description}"
		set_meta_tags title: @store.name,
									site: 'Claeus',
									reverse: true,
									description: @store.description.truncate(200),
									twitter: {
										card: 'summary',
										site: '@claeusgh',
										title: @store.name,
										description: @store.description.truncate(200)
									},
									og: {
										title: @store.name,
										description: @store.description.truncate(200),
										type: 'website',
										url: store_url(@store),
										image: @store.image
									}
	end

	def create
		@store = Store.new(store_params)
		@store.user_id = current_user.id
		if @store.save
			redirect_to store_dashboard_path(@store), notice: "You have created your store successfully"
		else
			render 'new'
		end
	end

	def settings
		@store = Store.friendly.find(params[:store_id])
	end

	def destroy
		
	end


	private

	def find_store
		@store = Store.friendly.find(params[:id])
	end

	def store_params
		params.require(:store).permit(:name, :description, :user_id, :store_type, :category_id)
	end
end