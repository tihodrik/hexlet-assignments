# frozen_string_literal: true
# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#

10.times do
  post = Post.create(title: Faker::Lorem.word, body: Faker::Lorem.sentence)
  3.times do
    post.comments.create(body: Faker::Lorem.sentence, author: Faker::Lorem.words(number: 2).join(' '))
  end
end
