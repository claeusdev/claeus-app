class ApplicationController < ActionController::Base
   protect_from_forgery with: :exception, unless: -> { request.format.json? }
   helper_method :set_cart
   
  
  def set_cart
    @cart = Cart.find(session[:cart_id])
  rescue ActiveRecord::RecordNotFound
    @cart = Cart.create
    session[:cart_id] = @cart.id
  end

  protected

    
   def after_sign_in_path_for(resource)
      user_path(current_user)
   end

   def after_sign_up_path_for(resource)
     user_path(current_user) #your path
   end
end
