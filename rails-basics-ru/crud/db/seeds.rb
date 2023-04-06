# frozen_string_literal: true

# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
100.times do
  name = Faker::Lorem.sentence
  description = Faker::Lorem.paragraph
  status = ['new', 'in progress', 'delayed', 'completed'].sample
  creator = Faker::Name.name
  performer = [Faker::Name.name, nil].sample
  completed = status == 'completed'

  Task.create(
    name: name,
    description: description,
    status: status,
    creator: creator,
    performer: performer,
    completed: completed
  )
end
