class FollowingsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_store

  def create
    current_user.follow(@store, current_user)
    @user = @store.user
    # FollowMailer.follow_message(@user).deliver

    # Creating notifications

    Notification.create(recipient: @store, actor: current_user, action: " followed your ", notifiable: @store )
    redirect_to @store, notice: "You have successfully followed!!"
  end

  def destroy
    current_user.unfollow(@store, current_user)
    @user = @store.user
    # FollowMailer.unfollow_message(@user).deliver
    Notification.create(recipient: @store, actor: current_user, action: " unfollowed", notifiable: @store )
    redirect_to @store, notice: "You just unfollowed this store!!"
  end

  private

  def set_store
    @store = Store.friendly.find(params[:store_id])
  end
end