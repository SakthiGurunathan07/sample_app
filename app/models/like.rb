class Like < ActiveRecord::Base
  attr_accessible :micropost_id, :user_id
  belongs_to :micropost
  belongs_to :user
end
