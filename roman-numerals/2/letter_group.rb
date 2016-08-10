class LetterGroup
  LETTER_GROUPS = [
    [''] + %w(I II III IV V VI VII VIII IX),
    [''] + %w(X XX XXX XL L LX LXX LXXX XC),
    [''] + %w(C CC CCC CD D DC DCC DCCC CM),
    [''] + %w(M MM MMM)]

  def initialize(number, letter_group_number)
    @number = number
    @letter_group_number = letter_group_number
  end

  def letters
    LETTER_GROUPS[letter_group_index][letters_index]
  end

  private
  
  def letters_index
    @number / @letter_group_number % 10
  end

  def letter_group_index
    Math.log10(@letter_group_number).to_i
  end
end
