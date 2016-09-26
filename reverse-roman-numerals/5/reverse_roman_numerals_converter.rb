module V5
  class ReverseRomanNumeralsConverter
    MAPPING = 'IV=4 IX=9 I=1 V=5 XL=40 XC=90 X=10 L=50 CD=400 CM=900 C=100 D=500 M=1000'
                .split(' ').map { |x| x.split('=') }.to_h

    def initialize(letters)
      @letters = letters
    end

    def to_numeral
      MAPPING.inject({ letters: @letters.dup, sum: 0 }) do |wow, (roman, number)|
        wow.tap do |tapped_wow|
          tapped_wow[:sum] += tapped_wow[:letters].gsub!(Regexp.new(roman)).count * number.to_i
        end
      end[:sum]
    end
  end
end
