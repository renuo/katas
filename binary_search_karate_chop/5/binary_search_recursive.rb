class BinarySearchRecursive
  NOT_FOUND = -1

  def self.chop(target, ordered_ints)
    binary_search = BinarySearchRecursive.new(target, ordered_ints)
    binary_search.chop_recursive(0, ordered_ints.size - 1)
  end

  def initialize(target, ordered_ints)
    @target = target
    @ordered_ints = ordered_ints
  end

  def chop_recursive(min_index, max_index)
    return NOT_FOUND if min_index > max_index

    middle = (min_index + max_index) / 2

    return middle if @ordered_ints[middle] == @target
    return NOT_FOUND if min_index == max_index

    return chop_recursive(middle + 1, max_index) if @ordered_ints[middle] < @target
    chop_recursive(min_index, middle)
  end
end
