class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
    # @stores = @user.stores.find(params[:id])
  end

  private 

  def followed_stores
  	@user = User.find(params[:id])
  	@followed_stores = Store.where(followers.include? @user)
  	@products = @followed_stores.products
  end
end