module V4
  class BinarySearch
    NOT_FOUND = -1

    def self.chop(target, ordered_ints)
      chop_recursive(target, ordered_ints, 0, ordered_ints.size - 1)
    end

    def self.chop_recursive(target, ordered_ints, min_index, max_index)
      return NOT_FOUND if min_index > max_index

      middle = (min_index + max_index) / 2

      return middle if ordered_ints[middle] == target
      return NOT_FOUND if min_index == max_index

      min_index = middle + 1 if ordered_ints[middle] < target
      max_index = middle if ordered_ints[middle] > target

      chop_recursive(target, ordered_ints, min_index, max_index)
    end
  end
end
