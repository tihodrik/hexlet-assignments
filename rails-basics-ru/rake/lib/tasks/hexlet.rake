# frozen_string_literal: true

require 'csv'

namespace :hexlet do
  desc 'Upload users from file'
  task :import_users, [:file_path] => :environment do |task, args|
    path = File.join(Rails.root, args.file_path)
    count = 0
    CSV.foreach(path, headers: :true ) do |row|
      user = User.new(
        first_name: row[0],
        last_name: row[1],
        birthday: Date.strptime(row[2], '%m/%d/%Y'),
        email: row[3]
      )
      count += 1 if user.save
    end
    pp "#{count} users have been added"
  end
end
