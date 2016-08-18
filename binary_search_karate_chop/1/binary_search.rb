class BinarySearch
  def self.chop(target, ordered_ints)
    BinarySearch.new(target, ordered_ints).chop
  end

  def initialize(target, ordered_ints)
    @target = target
    @ordered_ints = ordered_ints
  end

  def chop
    return -1 if @ordered_ints.empty?

    bottom = 0
    top = @ordered_ints.size - 1

    while top >= bottom
      middle = bottom + ((top - bottom) / 2)

      return middle if element_found?(middle)
      return -1 if top == bottom

      if middle_too_low?(middle)
        bottom = middle + 1
      else
        top = middle
      end
    end

    -1
  end

  private

  def middle_too_low?(middle)
    @ordered_ints[middle] < @target
  end

  def element_found?(middle)
    @ordered_ints[middle] == @target
  end
end
