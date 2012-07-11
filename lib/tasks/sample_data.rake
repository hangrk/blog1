namespace :db do
  desc "Fill database with sample data"
  task populate: :environment do
    make_users
    make_category
    make_posts
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

def make_category
  c = Category.create!(name:"uncategorized")
end

def make_posts
  users = User.all(limit: 6)
  c = Category.first
  3.times do
    content = Faker::Lorem.sentence(20)
    title = Faker::Lorem.sentence(3)
    users.each { |user| user.posts.create!(title: title, content: content, category_id: c.id) }
  end
end



