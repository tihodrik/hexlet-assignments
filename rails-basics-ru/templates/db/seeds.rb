# frozen_string_literal: true

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
