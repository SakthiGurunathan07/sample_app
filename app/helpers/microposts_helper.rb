module MicropostsHelper
    
    def user_likes_this_post(user , post)
     @liked_it= Like.where(["user_id= ? and micropost_id= ?" ,user.id , post.id])
    end

    def list_of_users_liked_this_post(post)
      @liked_users=[]
      Micropost.find(post).likes.each do |like| 
          @liked_users << like.user
      end
    end
end
