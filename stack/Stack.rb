class Stack

  attr_reader :elements

  def initialize(elements = nil)
    @elements = Array(elements)
  end

  def push(elements)
    @elements += Array(elements)
  end

  def pop(count = 1)
    reverse = @elements.reverse
    elements = normalize reverse.slice!(0, count)
    @elements = reverse.reverse
    elements
  end

  def top(count = 1)
    normalize @elements.reverse[0...count]
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