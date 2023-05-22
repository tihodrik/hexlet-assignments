# frozen_string_literal: true

require 'test_helper'
require 'rake'

class ImportUsersTest < ActiveSupport::TestCase
  def setup
    App::Application.load_tasks if Rake::Task.tasks.empty?
  end

  test 'import users' do
    path = 'test/fixtures/files/users.csv'

    assert_difference('User.count', +100) do
      Rake::Task['hexlet:import_users'].invoke(path)
    end

    assert User.find_by(email: 'fskune0@bandcamp.com'), true
  end
end
