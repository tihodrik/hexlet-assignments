# frozen_string_literal: true

require 'test_helper'

class TasksControllerTest < ActionDispatch::IntegrationTest
  test 'it opens index' do
    get tasks_url
    assert_response :success
  end

  test 'it checks task validation' do
    assert_equal tasks(:valid_task).valid?, true

    invalid_task = Task.new(
      name: 'Name',
      status: 'new',
      description: 'New Task',
      creator: '',
      performer: '',
      completed: true
    )
    assert_equal invalid_task.valid?, false
  end

  test 'it can read task description' do
    assert_equal tasks(:valid_task), Task.find_by(id: tasks(:valid_task).id)
  end

  test 'it can update records' do
    Task.first.update(name: 'Updated Task')
    assert_equal Task.first.name, 'Updated Task'
  end

  test 'it can destroy records' do
    initial_count = Task.count
    task_id = Task.first.id

    Task.first.destroy

    assert_equal Task.count, initial_count - 1
    assert_nil Task.find_by(id: task_id)
  end
end
