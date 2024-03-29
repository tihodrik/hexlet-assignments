# frozen_string_literal: true

# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#

require 'faker'

30.times do
  title = Faker::Lorem.sentence
  body = Faker::Lorem.paragraph
  Bulletin.create(title: title, body: body, published: [true, false].sample)
end
