module V3
  class ReverseRomanNumeralsConverter
    MAPPING = 'IV=4 IX=9 I=1 V=5 XL=40 XC=90 X=10 L=50 CD=400 CM=900 C=100 D=500 M=1000'
              .split(' ').map { |x| x.split('=') }.to_h

    def initialize(letters)
      @letters = letters
    end

    def to_numeral
      MAPPING.map { |roman, number| @letters.gsub!(roman, "#{number}|") }
      @letters.split('|').map(&:to_i).inject(&:+)
    end
  end
end
