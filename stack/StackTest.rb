require "test/unit"
require_relative "Stack"

class StackTest < Test::Unit::TestCase

  def test_stack_properties
    stack = Stack.new
    assert_equal [], stack.elements
    assert_equal 0, stack.size
    assert_equal "[]", stack.to_s

    stack = Stack.new(1)
    assert_equal [1], stack.elements
    assert_equal 1, stack.size
    assert_equal "[1]", stack.to_s

    stack = Stack.new([1, 2, 3])
    assert_equal [1, 2, 3], stack.elements
    assert_equal 3, stack.size
    assert_equal "[1, 2, 3]", stack.to_s
  end

  def test_push
    stack = Stack.new

    assert_raise(ArgumentError) { stack.push }
    assert_equal [], stack.elements

    assert_nothing_raised(ArgumentError) { stack.push(1) }
    assert_equal [1], stack.elements

    assert_nothing_raised(ArgumentError) { stack.push([2, 3]) }
    assert_equal [1, 2, 3], stack.elements
  end

  def test_pop
    stack = Stack.new([1, 2, 3, 4, 5])

    assert_raise(ArgumentError) { stack.pop("a") }
    assert_equal [1, 2, 3, 4, 5], stack.elements

    assert_equal 5, stack.pop
    assert_equal [1, 2, 3, 4], stack.elements

    assert_equal [4, 3, 2], stack.pop(3)
    assert_equal [1], stack.elements

    assert_equal 1, stack.pop(3)
    assert_equal [], stack.elements

    assert_equal nil, stack.pop
    assert_equal [], stack.elements
  end

  def test_top
    stack = Stack.new([1, 2, 3])

    assert_raise(ArgumentError) { stack.top("a") }
    assert_equal [1, 2, 3], stack.elements

    assert_equal 3, stack.top
    assert_equal [1, 2, 3], stack.elements

    assert_equal [3, 2], stack.top(2)
    assert_equal [1, 2, 3], stack.elements

    assert_equal [3, 2, 1], stack.top(4)
    assert_equal [1, 2, 3], stack.elements

    stack = Stack.new
    assert_equal nil, stack.top
    assert_equal [], stack.elements
  end

end