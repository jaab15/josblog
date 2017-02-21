# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

User.destroy_all
  User.create ({   first_name: "toto",
                   last_name:  "toto",
                   email: "toto@toto.com",
                   password_digest: "toto"
                 })


  User.create ({   first_name: "titi",
                   last_name:  "titi",
                   email: "titi@titi.com",
                   password_digest: "titi"
                 })

  User.create ({   first_name: "lolo",
                   last_name:  "lolo",
                   email: "lolo@lolo.com",
                   password_digest: "lolo"
                 })

puts Cowsay.say("Generate 3 users","random")


Category.destroy_all

Electronic = Category.create!(title: "Electronic")
Books      = Category.create!(title: "Books")
Games      = Category.create!(title: "Games")
Furnitures = Category.create!(title: "Furnitures")
Minerals   = Category.create!(title: "Minerals")
Pets       = Category.create!(title: "Pets")
Astronomy  = Category.create!(title: "Astronomy")
Watches    = Category.create!(title: "Watches")
Music      = Category.create!(title: "Music")
HiFi       = Category.create!(title: "HiFi")

puts Cowsay.say("Generate 10 categories","random")


Post.destroy_all

100.times do
  Post.create ({   title:    Faker::Address.city,
                   body:     Faker::ChuckNorris.fact,
                   category: Category.all.sample,
                   user:     User.all.sample
                 })
end
puts Cowsay.say("Generate 100 posts","random")


Comment.destroy_all

400.times do
  Comment.create ({ body:    Faker::Address.city,
                    post:    Post.all.sample,
                    user:    User.all.sample
                 })
end
puts Cowsay.say("Generate 400 comments","random")
