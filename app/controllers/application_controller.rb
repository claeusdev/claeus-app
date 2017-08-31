class ApplicationController < ActionController::Base
   protect_from_forgery with: :exception, unless: -> { request.format.json? }
   before_action :set_cart
   include CurrentCart
   

  protected

    
   def after_sign_in_path_for(resource)
      user_path(current_user)
   end

   def after_sign_up_path_for(resource)
     user_path(current_user) #your path
   end
end
