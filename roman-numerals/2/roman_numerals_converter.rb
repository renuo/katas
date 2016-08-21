require_relative 'letter_group'

module V2
  class RomanNumeralsConverter
    def initialize(number)
      @number = number
    end

    def to_roman
      letters_for(1000) + letters_for(100) + letters_for(10) + letters_for(1)
    end

    private

    def letters_for(letter_group_number)
      LetterGroup.new(@number, letter_group_number).letters
    end
  end
end
