class Stack

  attr_reader :elements

  def initialize(elements = nil)
    @elements = Array(elements)
  end

  def push(elements = nil)
    elements = Array(elements)
    if !elements.empty?
      elements.each do |element| 
        @elements.push(element)
      end
      return true
    end
    false
  end

  def pop(count = 1)
    elements = []
    for i in 0...count
      elements.push(@elements.pop)
      break if @elements.empty?
    end
    normalize(elements)
  end

  def top(count = 1)
    elements = []
    for i in 1..count
      elements.push(@elements[@elements.size - i])
      break if i == @elements.size
    end
    normalize(elements)
  end

  def size
    @elements.size
  end

  def to_s
    "[#{@elements.join(", ")}]"
  end

  private

    def normalize(elements = [])
      if elements.empty?
        return nil
      elsif elements.size == 1
        return elements[0]
      end
      return elements
    end

end