class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  mount_uploader :avatar, AvatarUploader


  has_one :store
  has_many :likes, dependent: :destroy
  has_many :followings
  has_many :followed_stores, through: :followings

  def following? store, user
    store.follower_ids.include? user.id
  end

  def follow (store, user)
    store.followers << user
  end

  def unfollow (store, user)
    store.followers.delete(user.id)
  end

  def toggle_like!(likeable)
    if like = likes.where(likeable: likeable).first
      like.destroy
    else
      likes.where(likeable: likeable).create!
    end
  end

  def likes!(likeable)
    likes.where(likeable: likeable).exists?
  end

end
