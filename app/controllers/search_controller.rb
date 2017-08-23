class SearchController < ApplicationController

	def search
		@products = Product.ransack(name_cont: params[:q]).result(distinct: true)
		@stores 	= Store.ransack(name_cont: params[:q]).result(distinct: true)

		@found_products = @products
		@found_stores = @stores
		
		respond_to do |format|
			format.html {}
			format.json {
				@store = @stores.limit(5)
				@products = @products.limit(5)
			}
		end
	end

end