require "test/unit"
require_relative "Queue"

class QueueTest < Test::Unit::TestCase

  def test_queue_properties
    queue = Queue.new
    assert_equal [], queue.elements
    assert_equal 0, queue.size
    assert_equal "[]", queue.to_s

    queue = Queue.new(1)
    assert_equal [1], queue.elements
    assert_equal 1, queue.size
    assert_equal "[1]", queue.to_s

    queue = Queue.new([1, 2, 3])
    assert_equal [1, 2, 3], queue.elements
    assert_equal 3, queue.size
    assert_equal "[1, 2, 3]", queue.to_s
  end

  def test_enqueue
    queue = Queue.new

    queue.enqueue
    assert_equal [], queue.elements

    queue.enqueue(1)
    assert_equal [1], queue.elements

    queue.enqueue([2, 3])
    assert_equal [1, 2, 3], queue.elements
  end

  def test_dequeue
    queue = Queue.new([1, 2, 3, 4, 5])

    assert_equal 1, queue.dequeue
    assert_equal [2, 3, 4, 5], queue.elements

    assert_equal [2, 3, 4], queue.dequeue(3)
    assert_equal [5], queue.elements

    assert_equal 5, queue.dequeue(3)
    assert_equal [], queue.elements

    assert_equal nil, queue.dequeue
    assert_equal [], queue.elements
  end

  def test_first
    queue = Queue.new([1, 2, 3])

    assert_equal 1, queue.first
    assert_equal [1, 2, 3], queue.elements

    assert_equal [1, 2], queue.first(2)
    assert_equal [1, 2, 3], queue.elements

    assert_equal [1, 2, 3], queue.first(4)
    assert_equal [1, 2, 3], queue.elements

    queue = Queue.new
    assert_equal nil, queue.first
    assert_equal [], queue.elements
  end

  def test_last
    queue = Queue.new([1, 2, 3])

    assert_equal 3, queue.last
    assert_equal [1, 2, 3], queue.elements

    assert_equal [3, 2], queue.last(2)
    assert_equal [1, 2, 3], queue.elements

    assert_equal [3, 2, 1], queue.last(4)
    assert_equal [1, 2, 3], queue.elements

    queue = Queue.new
    assert_equal nil, queue.last
    assert_equal [], queue.elements
  end

end