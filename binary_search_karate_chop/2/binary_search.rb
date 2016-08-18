class BinarySearch
  NOT_FOUND = -1

  def self.chop(target, ordered_ints)
    BinarySearch.new(target, ordered_ints).chop
  end

  def initialize(target, ordered_ints)
    @target = target
    @ordered_ints = ordered_ints
    @bottom = 0
    @top = @ordered_ints.size - 1
    recalculate_middle
  end

  def chop
    while @top >= @bottom
      return @middle if element_in_middle?
      return NOT_FOUND if @top == @bottom

      middle_too_low? ? increase_bottom : decrease_top

      recalculate_middle
    end

    NOT_FOUND
  end

  private

  def recalculate_middle
    @middle = @bottom + ((@top - @bottom) / 2)
  end

  def decrease_top
    @top = @middle
  end

  def increase_bottom
    @bottom = @middle + 1
  end

  def middle_too_low?
    @ordered_ints[@middle] < @target
  end

  def element_in_middle?
    @ordered_ints[@middle] == @target
  end
end
