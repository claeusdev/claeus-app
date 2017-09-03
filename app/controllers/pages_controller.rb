class PagesController < ApplicationController
  
  def home
  	@stores = Store.all
    @ftd = Store.all
    @categories = Category.all.order(name: :asc).limit(12)
    @featured = Store.all.order(created_at: :desc).limit(2)
    @products = Product.all.order(created_at: :desc).limit(12)
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
