require_relative 'digit_to_roman_converter'

class RomanNumeralsConverter
  def initialize(number)
    @number = number
  end

  def to_roman
    digit_at(3) + digit_at(2) + digit_at(1) + digit_at(0)
  end

  private

  def digit_at(digit_index)
    DigitToRomanConverter.new(@number, digit_index).convert_digit_to_roman
  end

  def convert_digit_to_roman(divisor, numbers)
    numbers[@number / divisor]
  end
end
