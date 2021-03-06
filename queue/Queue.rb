class Queue

  attr_reader :elements

  def initialize(elements = nil)
    @elements = Array(elements)
  end

  def enqueue(elements)
      @elements += Array(elements)
  end

  def dequeue(count = 1)
    throw "count must be an integer" unless count.is_a? Integer
    normalize @elements.slice!(0, count)
  end

  def first(count = 1)
    throw "count must be an integer" unless count.is_a? Integer
    normalize @elements[0...count]
  end

  def last(count = 1)
    throw "count must be an integer" unless count.is_a? Integer
    normalize @elements.reverse[0...count]
  end

  def size
    @elements.size
  end

  def to_s
    "[#{@elements.join(", ")}]"
  end

  private

    def normalize(elements = nil)
      if elements.empty?
        return nil
      elsif elements.size == 1
        return elements[0]
      end
      elements
    end

end