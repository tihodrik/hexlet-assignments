# frozen_string_literal: true
# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

10.times do
  post = Post.create(
    title: Faker::Lorem.words(number: 2).join(' '),
    body: Faker::Lorem.paragraph
  )
  5.times do
    post.comments.create(
      body: Faker::Lorem.sentence
    )
  end
end