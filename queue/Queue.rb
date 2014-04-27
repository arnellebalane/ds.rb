class Queue

  attr_reader :elements

  def initialize(elements = nil)
    @elements = Array(elements)
  end

  def enqueue(elements = nil)
    elements = Array(elements)
    if !elements.empty?
      elements.each do |element|
        @elements.push(element)
      end
      return true
    end
    false
  end

  def dequeue(count = 1)
    elements = []
    for i in 0...count
      elements.push(@elements.shift)
      break if @elements.empty?
    end
    normalized_element(elements)
  end

  def first(count = 1)
    elements = []
    for i in 0...count
      elements.push(@elements[i])
      break if i == @elements.size - 1
    end
    normalized_element(elements)
  end

  def last(count = 1)
    elements = []
    for i in 1..count
      elements.push(@elements[@elements.size - i])
      break if i == @elements.size
    end
    normalized_element(elements)
  end

  def size
    @elements.size
  end

  def to_s
    "[#{@elements.join(", ")}]"
  end

  private

    def normalized_element(elements = nil)
      if elements.empty?
        return nil
      elsif elements.size == 1
        return elements[0]
      end
      elements
    end

end