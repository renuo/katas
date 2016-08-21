module V5
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
    thousands + hundreds + tens + ones
  end

  def ones
    NUMBERS[1][ones_index]
  end

  def tens
    NUMBERS[10][tens_index]
  end

  def hundreds
    NUMBERS[100][hundreds_index]
  end

  def thousands
    NUMBERS[1000][thousands_index]
  end

  def ones_index
    @number % 10
  end

  def tens_index
    (@number / 10) % 10
  end

  def hundreds_index
    (@number / 100) % 10
  end

  def thousands_index
    @number / 1000
  end
end
end
