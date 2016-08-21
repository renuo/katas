require_relative 'virtual_array'

module V6
  class BinarySearch
    NOT_FOUND = -1

    def self.chop(target, ordered_ints)
      V6::BinarySearch.new(target, ordered_ints).chop
    end

    def initialize(target, ordered_ints)
      @target = target
      @values = VirtualArray.new(ordered_ints)
    end

    def chop
      while @values.length > 0
        middle_element = @values.middle_element
        return @values.original_middle_index if middle_element == @target

        middle_element < @target ? @values.remove_left_half : @values.remove_right_half
      end

      NOT_FOUND
    end
  end
end
