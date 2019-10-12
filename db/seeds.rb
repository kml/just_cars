# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

100.times do
  now = Time.now

  offer = Offer.create(
    title: Faker::Lorem.sentence,
    description: Faker::Lorem.paragraphs(number: 2).join(" "),
    price: rand(2_000..30_000),
  )

  offer.photo.attach(io: Rails.root.join("db", "seeds", "photo_1000x1000.png").open , filename: 'photo.png')
end
