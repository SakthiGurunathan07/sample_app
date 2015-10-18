class LikesController < ApplicationController
 before_filter :signed_in_user

 def create
 	 @current_micropost = Micropost.find(params[:micropost_id])
     @current_micropost.add_like(current_user)
     redirect_to root_url
  end

 def destroy
 	@current_micropost = Micropost.find(params[:micropost_id])
 	@current_micropost.delete_like(current_user)
    redirect_to root_url
 end
 
end
