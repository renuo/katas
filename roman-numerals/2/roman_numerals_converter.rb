class RomanNumeralsConverter
  LETTER_GROUPS = [
    [''] + %w(I II III IV V VI VII VIII IX),
    [''] + %w(X XX XXX XL L LX LXX LXXX XC),
    [''] + %w(C CC CCC CD D DC DCC DCCC CM),
    [''] + %w(M MM MMM)]

  def initialize(number)
    @number = number
  end

  def to_roman
    letters_for(1000) + letters_for(100) + letters_for(10) + letters_for(1)
  end

  private

  def letters_for(letter_group_number)
    letter_group_index = letter_group_index(letter_group_number)
    letters_index = letters_index(letter_group_number)
    LETTER_GROUPS[letter_group_index][letters_index]
  end

  def letters_index(letter_group_number)
    @number / letter_group_number % 10
  end

  def letter_group_index(letter_group_number)
    Math.log10(letter_group_number).to_i
  end
end
