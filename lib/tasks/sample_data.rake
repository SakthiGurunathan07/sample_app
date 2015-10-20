namespace :db do
  desc "Fill database with sample data"
  task populate: :environment do
    make_users
    make_microposts
    make_relationships
    make_likes
  end
end

def make_users
  admin = User.create!(name:     "Example User",
                       email:    "example@railstutorial.org",
                       password: "foobar",
                       password_confirmation: "foobar")
  admin.toggle!(:admin)
  99.times do |n|
    name  = Faker::Name.name
    email = "example-#{n+1}@railstutorial.org"
    password  = "password"
    User.create!(name:     name,
                 email:    email,
                 password: password,
                 password_confirmation: password)
  end
end

def make_microposts
  users = User.all(limit: 6)
  50.times do
    content = Faker::Lorem.sentence(5)
    users.each { |user| user.microposts.create!(content: content) }
  end
end

def make_relationships
  users = User.all
  user  = users.first
  followed_users = users[2..50]
  followers      = users[3..40]
  followed_users.each { |followed| user.follow!(followed) }
  followers.each      { |follower| follower.follow!(user) }
end

def make_likes
  Micropost.find_each do |post|
    Micropost.reset_counters(post.id, :likes)
  end
  users1 =User.find((1..30).to_a)
  users2=User.find((31..50).to_a)
  micropost1 = User.first.microposts.first
 
  users1.each do |user|
    Like.create!(user_id: user.id , micropost_id: micropost1.id )
  end
  users2.each do |user|
    Like.create!(user_id: user.id , micropost_id: micropost1.id )
  end

  micropost2 = User.first.microposts.fifth

  users1.each do |user|
    Like.create!(user_id: user.id , micropost_id: micropost2.id )
  end
 
  micropost3 = User.first.microposts.last

  users2.each do |user|
    Like.create!(user_id: user.id , micropost_id: micropost3.id )
  end

end