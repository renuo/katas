require_relative '../roman_numerals_converter'

describe V1::RomanNumeralsConverter do
  def self.check(number, letter)
    it "converts #{number} to #{letter}" do
      converter = V1::RomanNumeralsConverter.new(number)
      expect(converter.to_roman).to eq(letter)
    end
  end

  describe 'single letters' do
    check(1, 'I')
    check(5, 'V')
    check(10, 'X')
    check(50, 'L')
    check(100, 'C')
    check(500, 'D')
    check(1000, 'M')
  end

  describe 'same letter multiple times' do
    check(2, 'II')
    check(3, 'III')
    check(20, 'XX')
    check(30, 'XXX')
    check(200, 'CC')
    check(300, 'CCC')
    check(2000, 'MM')
    check(3000, 'MMM')
  end

  describe 'combined letters' do
    check(6, 'VI')
    check(7, 'VII')
    check(8, 'VIII')
    check(16, 'XVI')
    check(26, 'XXVI')
    check(27, 'XXVII')
    check(28, 'XXVIII')
    check(38, 'XXXVIII')
    check(2888, 'MMDCCCLXXXVIII')
  end

  describe 'subtract cases' do
    check(4, 'IV')
    check(40, 'XL')
    check(400, 'CD')
    check(44, 'XLIV')
    check(440, 'CDXL')
    check(444, 'CDXLIV')
  end

  describe '9 cases' do
    check(9, 'IX')
    check(90, 'XC')
    check(900, 'CM')
  end

  describe 'combined 9 cases' do
    check(19, 'XIX')
    check(29, 'XXIX')
    check(99, 'XCIX')
    check(999, 'CMXCIX')
    check(929, 'CMXXIX')
  end

  describe 'integration tests' do
    check(1999, 'MCMXCIX')
    check(1943, 'MCMXLIII')
    check(2999, 'MMCMXCIX')
  end
end
