module V6
class RomanNumeralsConverter
  NUMBERS = {
    1 => [''] + %w(I II III IV V VI VII VIII IX),
    10 => [''] + %w(X XX XXX XL L LX LXX LXXX XC),
    100 => [''] + %w(C CC CCC CD D DC DCC DCCC CM),
    1000 => [''] + %w(M MM MMM)
  }.freeze

  def initialize(number)
    @number = number
  end

  def to_roman
    roman_for(1000) + roman_for(100) + roman_for(10) + roman_for(1)
  end

  def roman_for(digit)
    NUMBERS[digit][@number / digit % 10]
  end
end
end
