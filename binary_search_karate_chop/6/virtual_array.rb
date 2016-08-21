module V6
  class VirtualArray
    def initialize(original_array)
      @original_array = original_array
      @left_offset = 0
      @right_offset = 0
    end

    def length
      @original_array.length - @left_offset - @right_offset
    end

    def [](index)
      raise_index_error(index) if length - index <= 0

      @original_array.fetch(@left_offset + index)
    end

    private def raise_index_error(index)
      raise IndexError, "index #{index} outside of array bounds: 0...#{length}"
    end

    def remove_left_half
      raise_index_error(0) if length <= 0

      @left_offset += half_length
    end

    def remove_right_half
      raise_index_error(0) if length <= 0

      @right_offset += half_length
    end

    private def half_length
      (length + 1) / 2
    end

    def middle_element
      self.[](middle_index)
    end

    def middle_index
      (length - 1) / 2
    end

    def original_middle_index
      @left_offset + middle_index
    end

    def any?
      length.positive?
    end
  end
end
