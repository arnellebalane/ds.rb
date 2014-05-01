require "test/unit"
require_relative "ArrayList"

class ArrayListTest < Test::Unit::TestCase

  def test_arraylist_properties
    list = ArrayList.new
    assert_equal [], list.elements
    assert_equal 0, list.size
    assert_equal '[]', list.to_s

    list = ArrayList.new(1)
    assert_equal [1], list.elements
    assert_equal 1, list.size
    assert_equal '[1]', list.to_s

    list = ArrayList.new([1, 2, 3])
    assert_equal [1, 2, 3], list.elements
    assert_equal 3, list.size
    assert_equal '[1, 2, 3]', list.to_s
  end

  def test_insert_first
    list = ArrayList.new

    assert_raise(ArgumentError) { list.insert_first }
    assert_equal [], list.elements

    assert_nothing_raised(ArgumentError) { list.insert_first(1) }
    assert_equal [1], list.elements

    assert_nothing_raised(ArgumentError) { list.insert_first([2, 3]) }
    assert_equal [3, 2, 1], list.elements
  end

  def test_insert_last
    list = ArrayList.new

    assert_raise(ArgumentError) { list.insert_last }
    assert_equal [], list.elements

    list.insert_last(1)
    assert_equal [1], list.elements

    list.insert_last([2, 3])
    assert_equal [1, 2, 3], list.elements
  end

  def test_insert_at
    list = ArrayList.new

    assert_raise(ArgumentError) { list.insert_at }
    assert_equal [], list.elements

    assert_raise(ArgumentError) { list.insert_at(0) }
    assert_equal [], list.elements

    assert_equal false, list.insert_at(-1, 1)
    assert_equal [], list.elements

    assert_equal false, list.insert_at(1, 1)
    assert_equal [], list.elements

    assert_equal true, list.insert_at(0, 1)
    assert_equal [1], list.elements

    assert_equal true, list.insert_at(0, 2)
    assert_equal [2, 1], list.elements

    assert_equal true, list.insert_at(2, 3)
    assert_equal [2, 1, 3], list.elements

    assert_equal true, list.insert_at(2, 4)
    assert_equal [2, 1, 4, 3], list.elements
  end

  def test_remove_first
    list = ArrayList.new([1, 2, 3, 4, 5])

    assert_equal 1, list.remove_first
    assert_equal [2, 3, 4, 5], list.elements

    assert_equal [2, 3, 4], list.remove_first(3)
    assert_equal [5], list.elements

    assert_equal 5, list.remove_first(3)
    assert_equal [], list.elements

    list = ArrayList.new
    assert_equal nil, list.remove_first
    assert_equal [], list.elements
  end

  def test_remove_last
    list = ArrayList.new([1, 2, 3, 4, 5])

    assert_equal 5, list.remove_last
    assert_equal [1, 2, 3, 4], list.elements

    assert_equal [4, 3, 2], list.remove_last(3)
    assert_equal [1], list.elements

    assert_equal 1, list.remove_last(3)
    assert_equal [], list.elements

    list = ArrayList.new
    assert_equal nil, list.remove_last
    assert_equal [], list.elements
  end

  def test_remove_at
    list = ArrayList.new([1, 2, 3, 4, 5])

    assert_raise(ArgumentError) { list.remove_at }
    assert_equal [1, 2, 3, 4, 5], list.elements

    assert_equal nil, list.remove_at(-1)
    assert_equal [1, 2, 3, 4, 5], list.elements

    assert_equal nil, list.remove_at(5)
    assert_equal [1, 2, 3, 4, 5], list.elements

    assert_equal 1, list.remove_at(0)
    assert_equal [2, 3, 4, 5], list.elements

    assert_equal 5, list.remove_at(3)
    assert_equal [2, 3, 4], list.elements

    assert_equal 3, list.remove_at(1)
    assert_equal [2, 4], list.elements
  end

  def test_get_first
    list = ArrayList.new([1, 2, 3])

    assert_equal 1, list.get_first
    assert_equal [1, 2, 3], list.elements

    assert_equal [1, 2], list.get_first(2)
    assert_equal [1, 2, 3], list.elements

    assert_equal [1, 2, 3], list.get_first(4)
    assert_equal [1, 2, 3], list.elements

    list = ArrayList.new
    assert_equal nil, list.get_first
    assert_equal [], list.elements
  end

  def test_get_last
    list = ArrayList.new([1, 2, 3])

    assert_equal 3, list.get_last
    assert_equal [1, 2, 3], list.elements

    assert_equal [3, 2], list.get_last(2)
    assert_equal [1, 2, 3], list.elements

    assert_equal [3, 2, 1], list.get_last(4)
    assert_equal [1, 2, 3], list.elements

    list = ArrayList.new
    assert_equal nil, list.get_last
    assert_equal [], list.elements
  end

  def test_get_at
    list = ArrayList.new([1, 2, 3])

    assert_raise(ArgumentError) { list.get_at }
    assert_equal [1, 2, 3], list.elements

    assert_equal nil, list.get_at(-1)
    assert_equal [1, 2, 3], list.elements

    assert_equal nil, list.get_at(3)
    assert_equal [1, 2, 3], list.elements

    assert_equal 2, list.get_at(1)
    assert_equal [1, 2, 3], list.elements
  end

end