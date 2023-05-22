# frozen_string_literal: true

require 'csv'

namespace :hexlet do
  desc 'Upload users from file'
  task :import_users, [:file_path] => :environment do |_task, args|
    abort 'Data path is required!' unless args.file_path
    puts args.file_path

    path = File.join(Rails.root, args.file_path)
    abort 'Cant find data file!' unless File.exist?(args.file_path)

    CSV.foreach(path, headers: true) do |row|
      bday = Date.strptime(row['birthday'], '%m/%d/%Y')
      User.create!(row.to_hash.merge(birthday: bday))
    end

    puts 'Successfuly loaded!'
  end
end
