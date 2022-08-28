# frozen_string_literal: true
# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

User.create!(name:  "管理ユーザー",
  email: "admin@example.com",
  password:              "adminpass",
  password_confirmation: "adminpass",
  admin: true)

99.times do |n|
name  = Faker::Name.name
email = "example-#{n+1}@example.com"
password = "password"
User.create!(name:  name,
    email: email,
    password:              password,
    password_confirmation: password)
end

users = User.order(:created_at).take(6)
datetime_range = Date.yesterday..Date.tomorrow
50.times do
  content = Faker::Lorem.sentence(5)
  users.each do |user|
    user.selling_images.create!(
      content: content,
      title: "title_#{rand(100..60000)}",
      price: rand(100..60000),
      valid_from: rand(datetime_range),
      valid_to: rand(datetime_range),
      picture: open("#{Rails.root}/db/fixtures/image0#{rand(1..9)}.jpeg")
    )
  end
end

50.times do
  SellingImage.all.each do |image|
    UserItemView.create!(selling_image_id: image.id, user_id: rand(1..20))
  end
end
