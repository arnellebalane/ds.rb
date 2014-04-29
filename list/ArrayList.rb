class ArrayList

  attr_reader :elements

  def initialize(elements = nil)
    @elements = Array(elements)
  end

  def insert_first(elements = nil)
    @elements = Array(elements).reverse + @elements
  end

  def insert_last(elements = nil)
    @elements += Array(elements)
  end

  def insert_at(index = nil, element = nil)
    if index and element and index >= 0 and index <= @elements.size
      @elements = @elements[0...index] + Array(element) + @elements[index..-1]
      return true
    end
    false
  end

  def remove_first(count = 1)
    normalize @elements.slice!(0, count)
  end

  def remove_last(count = 1)
    reverse = @elements.reverse
    elements = normalize reverse.slice!(0, count)
    @elements = reverse.reverse
    elements
  end

  def remove_at(index = nil)
    if index and index >= 0 and index < @elements.size
      return @elements.delete_at(index)
    end
    nil
  end

  def get_first(count = 1)
    normalize @elements[0...count]
  end

  def get_last(count = 1)
    normalize @elements.reverse[0...count]
  end

  def get_at(index = nil)
    if index and index >= 0 and index < @elements.size
      return @elements[index]
    end
    nil
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