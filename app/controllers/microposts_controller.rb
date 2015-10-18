class MicropostsController < ApplicationController

  before_filter :signed_in_user, only: [:create, :destroy ,:likes,:unlikes]
  before_filter :correct_user,   only: [:destroy ]
  before_filter :find_post,   only: [:likes ,:unlikes]
  before_filter :user_liked_post ,   only: [:likes ,:unlikes]

  def index
  end

 def create
    @micropost = current_user.microposts.build(params[:micropost])
    if @micropost.save
      flash[:success] = "Micropost created!"
      redirect_to root_url
    else
       @feed_items = []
      render 'static_pages/home'
    end
  end


 def destroy
    @micropost.destroy
    redirect_to root_url
 end

 

 def likes
     Like.create!(micropost_id: @current_micropost.id, user_id:current_user.id)
     redirect_to root_url
  end

 def unlikes
    Like.destroy(@user_liked_post)
    redirect_to root_url
 end
 
  private

    def correct_user
      @micropost = current_user.microposts.find_by_id(params[:id])
      redirect_to root_url if @micropost.nil?
    end

    def find_post
     @current_micropost =Micropost.find(params[:id])   
    end

    def user_liked_post
      @user_liked_post=Like.where(["user_id= ? and micropost_id= ?" ,current_user.id ,@current_micropost.id])
    end
  

end
