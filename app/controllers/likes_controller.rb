class LikesController < ApplicationController
 before_filter :signed_in_user


 def create
 	   @current_micropost = Micropost.find(params[:micropost_id])
     @liked_it=Like.create(micropost_id: @current_micropost.id, user_id:current_user.id)
    respond_to do |format|
       format.html { redirect_to root_url }
       format.js 
    end
 
  end

 def destroy
 	@current_micropost = Micropost.find(params[:micropost_id])
  @user_liked_post=Like.find(params[:id])
  @user_liked_post.destroy
  respond_to do |format|
      format.html { redirect_to root_url }
      format.js 
    end
 end
 
end
