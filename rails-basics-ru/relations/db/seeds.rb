# frozen_string_literal: true

# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# ['New', 'In progress', 'Done'].each do |status|
#   Status.create(name: status)
# end

# 10.times do
#   User.create(name: Faker::Name.name)
# end

users = User.all
statuses = Status.all

100.times do
  pp Task.create(
    name: Faker::Lorem.sentence(word_count: rand(1..5)),
    description: Faker::Lorem.paragraph(sentence_count: rand(1..30)),
    status: statuses.sample,
    user: users.sample
  )
end
