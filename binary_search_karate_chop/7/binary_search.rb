module V7
  class BinarySearch
    NOT_FOUND = -1

    def self.chop(target, ordered_ints)
      V7::BinarySearch.new(target, ordered_ints).chop
    end

    def initialize(target, ordered_ints)
      @target = target
      @values = ordered_ints
      @left_offset = 0
    end

    def chop
      while @values.length > 0
        return middle_index + @left_offset if @values[middle_index] == @target
        
        @values[middle_index] < @target ? remove_left_half : remove_right_half
      end

      NOT_FOUND
    end

    def middle_index
      @values.length / 2
    end

    def remove_right_half
      @values.slice!(middle_index..@values.length)
    end

    def remove_left_half
      @left_offset += middle_index + 1
      @values.slice!(0..middle_index)
    end
  end
end
