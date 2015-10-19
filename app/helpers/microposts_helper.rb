module MicropostsHelper
    
    def user_likes_this_post(user , post)
     @liked_it= Like.where(["user_id= ? and micropost_id= ?" ,user.id , post.id])
    end
end
