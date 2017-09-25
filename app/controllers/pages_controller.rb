class PagesController < ApplicationController
  
  def home
  	@stores = Store.all
    @ftd = Store.all
    @categories = Category.all.order(name: :asc).limit(12)
    @featured = Store.all.order(created_at: :desc).limit(2)
    @products = Product.all.order(created_at: :desc).limit(12)
    @meta_description = "Claeus, an ecommerce platform for emerging brands, find products, stores and brands from across Africa."
  end

  def sell
    
  end

  def about
  end

  def contact
  end

  def blog
    
  end

  def careers
    
  end
end
