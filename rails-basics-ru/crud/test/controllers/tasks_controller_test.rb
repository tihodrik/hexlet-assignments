# frozen_string_literal: true

require 'test_helper'

class TasksControllerTest < ActionDispatch::IntegrationTest
  def setup
    @task = tasks(:task1)
    @attrs = {
      name: 'Add to group',
      description: 'Add user Malva Velkran to group of Facebook users',
      creator: 'Rikki Milk',
      performer: 'Monty Glow'
    }
  end
  test 'should get index' do
    get root_path
    assert_response :success
  end

  test 'should get new' do
    get new_task_path
    assert_response :success
  end

  test 'should create task' do
    assert_difference('Task.count') do
      post tasks_path, params: {
        task: @attrs
      }
    end
    assert_redirected_to task_path(Task.last)

    get task_path(Task.last)
    assert_select 'h1', "#{@attrs[:name]} [New]"
  end

  test 'should show task' do
    get task_path(@task)
    assert_response :success
  end

  test 'should get edit' do
    get edit_task_path(@task)
    assert_response :success
  end

  test 'should update task' do
    patch task_path(@task), params: {
      task: @attrs
    }
    assert_redirected_to task_path(Task.last)

    @task.reload
    assert_equal @task.name, @attrs[:name]
  end

  test 'should destroy task' do
    assert_difference('Task.count', -1) do
      delete task_path(Task.last)
    end

    assert_redirected_to tasks_path
  end
end
