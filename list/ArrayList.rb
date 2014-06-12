class ArrayList

  attr_reader :elements

  def initialize(elements = nil)
    @elements = Array(elements)
  end

  def insert_first(elements)
    @elements = Array(elements).reverse + @elements
  end

  def insert_last(elements)
    @elements += Array(elements)
  end

  def insert_at(index, element)
    if index >= 0 and index <= @elements.size
      @elements = @elements[0...index] + Array(element) + @elements[index..-1]
      return true
    end
    false
  end

  def remove_first(count = 1)
    throw "count must be an integer" unless count.is_a? Integer
    normalize @elements.slice!(0, count)
  end

  def remove_last(count = 1)
    throw "count must be an integer" unless count.is_a? Integer
    reverse = @elements.reverse
    elements = normalize reverse.slice!(0, count)
    @elements = reverse.reverse
    elements
  end

  def remove_at(index)
    if index >= 0 and index < @elements.size
      return @elements.delete_at(index)
    end
    nil
  end

  def get_first(count = 1)
    throw "count must be an integer" unless count.is_a? Integer
    normalize @elements[0...count]
  end

  def get_last(count = 1)
    throw "count must be an integer" unless count.is_a? Integer
    normalize @elements.reverse[0...count]
  end

  def get_at(index)
    if index >= 0 and index < @elements.size
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