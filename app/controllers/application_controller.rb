class ApplicationController < ActionController::Base
   protect_from_forgery with: :exception, unless: -> { request.format.json? }
   helper_method :get_cart
   
  
  def set_cart
    @cart = Cart.create
    session[:cart_id] = @cart.id
    @cart
  end

  def get_cart
    return @cart if @cart

    Rails.logger.info "Loading from DB"
    if session[:cart_id]
      @cart = Cart.find session[:cart_id]
    else
      set_cart
    end
  end

  def destroy_cart
    session[:cart_id].nil
  end
  
  protected

    
   def after_sign_in_path_for(resource)
      user_path(current_user)
   end

   def after_sign_up_path_for(resource)
     user_path(current_user) #your path
   end
end
