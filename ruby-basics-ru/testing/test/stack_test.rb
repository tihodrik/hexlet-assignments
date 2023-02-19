# frozen_string_literal: true

require_relative 'test_helper'
require_relative '../lib/stack'

class StackTest < Minitest::Test
  # BEGIN

  def setup
    @sample_array = [1, 'two', [3], { four: 'five' }]
  end

  def teardown; end

  def test_that_items_pushed_into_top_of_stack
    stack = Stack.new
    array = []

    @sample_array.each do |item|
      assert_equal stack.push!(item), array.push(item)
    end
  end

  def test_that_items_poped_from_top_of_stack
    stack = Stack.new(@sample_array)

    @sample_array.reverse.each do |item|
      assert_equal stack.pop!, item
    end
  end

  def test_that_pop_from_empty_stack_returns_nil
    stack = Stack.new
    assert_nil stack.pop!
  end

  def test_that_clearing_not_empty_stack_makes_stack_empty
    stack = Stack.new(@sample_array)
    stack.clear!

    assert_empty stack
  end

  def test_that_clearing_empty_stack_keeps_stack_empty
    stack = Stack.new
    stack.clear!

    assert_empty stack
  end

  def test_that_new_stack_is_empty
    stack = Stack.new
    assert_empty stack
  end

  def test_that_not_empty_stack_is_not_empty
    stack = Stack.new(@sample_array)
    refute_empty stack
  end

  # END
end

test_methods = StackTest.new({}).methods.select { |method| method.start_with? 'test_' }
raise 'StackTest has not tests!' if test_methods.empty?
