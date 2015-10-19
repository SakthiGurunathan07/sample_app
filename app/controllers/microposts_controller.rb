class MicropostsController < ApplicationController

  before_filter :signed_in_user, only: [:create, :destroy , :show]
  before_filter :correct_user,   only: [:destroy ]
  before_filter :find_post,   only: [ :show]



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

 def show
  @current_micropost
 end

 
 
 private

    def correct_user
      @micropost = current_user.microposts.find_by_id(params[:id])
      redirect_to root_url if @micropost.nil?
    end

    def find_post
     @current_micropost =Micropost.find(params[:id])   
    end



end
