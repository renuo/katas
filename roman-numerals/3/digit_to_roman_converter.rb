class DigitToRomanConverter
  NUMBERS = [
    [''] + %w(I II III IV V VI VII VIII IX),
    [''] + %w(X XX XXX XL L LX LXX LXXX XC),
    [''] + %w(C CC CCC CD D DC DCC DCCC CM),
    [''] + %w(M MM MMM)
  ].freeze

  def initialize(number, digit_index)
    @cut_number = number % (10**(digit_index + 1))
    @roman_numbers = NUMBERS[digit_index]
    @divisor = 10**digit_index
  end

  def convert_digit_to_roman
    @roman_numbers[@cut_number / @divisor]
  end
end
