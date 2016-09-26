module V2
  class ReverseRomanNumeralsConverter
    def initialize(letter)
      @letter = letter
      @regex = /([M]+)?([CD]+[CDM]*)?([XL]+[XLC]*)?([IV]+[IVX]*)?/
    end

    def to_numeral
      groups = @letter.match(@regex).to_a.map(&:to_s)
      convert_ones(groups[4]) + convert_tens(groups[3]) + convert_hundreds(groups[2]) + convert_thousands(groups[1])
    end

    def convert_thousands(thousands)
      roman_to_arabic(thousands, 'M')
    end

    def convert_hundreds(hundreds)
      return 900 if hundreds == 'CM'
      return 400 if hundreds == 'CD'
      roman_to_arabic(hundreds, 'C') + roman_to_arabic(hundreds, 'D')
    end

    def convert_tens(tens)
      return 90 if tens == 'XC'
      return 40 if tens == 'XL'
      roman_to_arabic(tens, 'X') + roman_to_arabic(tens, 'L')
    end

    def convert_ones(ones)
      return 9 if ones == 'IX'
      return 4 if ones == 'IV'
      roman_to_arabic(ones, 'I') + roman_to_arabic(ones, 'V')
    end

    ROMAN_TO_ARABIC_MAPPING = { 'I' => 1, 'V' => 5, 'X' => 10,
                                'L' => 50, 'C' => 100, 'D' => 500, 'M' => 1000 }.freeze

    def roman_to_arabic(roman_number, letter)
      ROMAN_TO_ARABIC_MAPPING[letter] * roman_number.count(letter)
    end
  end
end
