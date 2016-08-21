require_relative 'number_letter_pair'

module V1
  class RomanNumeralsConverter
    NUMBERS = [
      NumberLetterPair.new(1000, 'M'),
      NumberLetterPair.new(500, 'D'),
      NumberLetterPair.new(100, 'C'),
      NumberLetterPair.new(50, 'L'),
      NumberLetterPair.new(10, 'X'),
      NumberLetterPair.new(5, 'V'),
      NumberLetterPair.new(1, 'I')
    ].freeze

    def initialize(number)
      @buffer = ''
      @number = number
    end

    def to_roman
      handle_pairs
      @buffer
    end

    def handle_pairs
      NUMBERS.each_with_index do |pair, index|
        handle_pair(pair, NUMBERS[index - 1], NUMBERS[index + 2])
      end
    end

    def handle_pair(pair, previous_pair, after_next_pair)
      handle_4_subtract_case(pair, previous_pair)
      handle_normal_case(pair)
      handle_9_subtract_case(pair, after_next_pair)
    end

    def handle_4_subtract_case(pair, previous_pair)
      return if (@number - pair.number * 4).negative?

      @buffer += "#{pair.letter}#{previous_pair.letter}"
      @number -= 4 * pair.number
    end

    def handle_normal_case(pair)
      while @number - pair.number >= 0
        @buffer += pair.letter
        @number -= pair.number
      end
    end

    def handle_9_subtract_case(pair, after_next_pair)
      return unless after_next_pair
      return unless @number + after_next_pair.number >= pair.number

      @buffer += "#{after_next_pair.letter}#{pair.letter}"
      @number -= (pair.number - after_next_pair.number)
    end
  end
end
