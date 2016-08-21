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
        return @values.original_middle_index if element_found?

        remove_left_half? ? @values.remove_left_half : @values.remove_right_half
      end

      NOT_FOUND
    end


    private
    def element_found?
      @values.middle_element == @target
    end

    def remove_left_half?
      @values.middle_element < @target
    end
  end
end
