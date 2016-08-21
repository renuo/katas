module V4
class RomanNumeralsConverter
  NUMBERS_ONES = [''] + %w(I II III IV V VI VII VIII IX)
  NUMBERS_TENS = [''] + %w(X XX XXX XL L LX LXX LXXX XC)
  NUMBERS_HUND = [''] + %w(C CC CCC CD D DC DCC DCCC CM)
  NUMBERS_THOU = [''] + %w(M MM MMM)

  def initialize(number)
    @number = number
  end

  def to_roman
    thousands + hundreds + tens + ones
  end

  private

  def thousands
    NUMBERS_THOU[@number / 1000]
  end

  def hundreds
    NUMBERS_HUND[(@number / 100) % 10]
  end

  def tens
    NUMBERS_TENS[(@number / 10) % 10]
  end

  def ones
    NUMBERS_ONES[@number % 10]
  end
end
end
