class Like < ActiveRecord::Base
  attr_accessible :micropost_id, :user_id
  belongs_to :micropost , :counter_cache => true
  belongs_to :user
  validates :user_id , presence: true
  validates :micropost_id , presence: true
end
