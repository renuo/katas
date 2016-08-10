class RomanNumeralsConverter
  LETTERS = [
    %w(I II III IV V VI VII VIII IX),
    %w(X XX XXX XL L LX LXX LXXX XC),
    %w(C CC CCC CD D DC DCC DCCC CM),
    %w(M MM MMM)]

  def initialize(number)
    @number = number
  end

  def to_roman
    thousands + hundreds + tens + ones
  end

  private

  def thousands
    extract_letters(LETTERS[3], @number / 1000)
  end

  def hundreds
    extract_letters(LETTERS[2], @number % 1000 / 100)
  end

  def tens
    extract_letters(LETTERS[1], @number % 100 / 10)
  end

  def ones
    extract_letters(LETTERS[0], @number % 10)
  end

  def extract_letters(letters, index_of_extracted_letters)
    index_of_extracted_letters -= 1
    return '' if index_of_extracted_letters < 0
    letters[index_of_extracted_letters].to_s
  end
end
