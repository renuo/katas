module V1
  class ReverseRomanNumeralsConverter
    def initialize(letter)
      @letter = letter
      @carry_the_nine_over = 0
    end

    def to_numeral
      @carry_the_nine_over = 0
      ones + tens + hundreds + thousands
    end

    def thousands
      1000 * numeral_for('M', '-', '-')
    end

    def hundreds
      100 * numeral_for('C', 'D', 'M')
    end

    def tens
      10 * numeral_for('X', 'L', 'C')
    end

    def ones
      numeral_for('I', 'V', 'X')
    end

    def numeral_for(one_x, five_x, ten_x)
      return nine_x_special_case if @letter.include?("#{one_x}#{ten_x}")
      return 4 if @letter.include?("#{one_x}#{five_x}")

      result = @letter.count(five_x) * 5 + (@letter.count(one_x) - @carry_the_nine_over)
      @carry_the_nine_over = 0
      result
    end

    def nine_x_special_case
      @carry_the_nine_over = 1
      9
    end
  end
end
