require_relative '../roman_numerals_converter'

describe V3::RomanNumeralsConverter do
  def self.check(number, letter)
    it "converts #{number} to #{letter}" do
      converter = V3::RomanNumeralsConverter.new(number)
      expect(converter.to_roman).to eq(letter)
    end
  end

  describe 'one to nine' do
    check 1, 'I'
    check 2, 'II'
    check 3, 'III'
    check 4, 'IV'
    check 5, 'V'
    check 6, 'VI'
    check 7, 'VII'
    check 8, 'VIII'
    check 9, 'IX'
  end

  describe 'ten to ninety' do
    check 10, 'X'
    check 20, 'XX'
    check 30, 'XXX'
    check 40, 'XL'
    check 50, 'L'
    check 60, 'LX'
    check 70, 'LXX'
    check 80, 'LXXX'
    check 90, 'XC'
  end

  describe 'hundred to nine hundred' do
    check 100, 'C'
    check 200, 'CC'
    check 300, 'CCC'
    check 400, 'CD'
    check 500, 'D'
    check 600, 'DC'
    check 700, 'DCC'
    check 800, 'DCCC'
    check 900, 'CM'
  end

  describe 'thousand to three thousand' do
    check 1000, 'M'
    check 2000, 'MM'
    check 3000, 'MMM'
  end

  describe 'combined roman numbers' do
    check 11, 'XI'
    check 111, 'CXI'
    check 1111, 'MCXI'
    check 101, 'CI'
    check 1001, 'MI'
    check 1010, 'MX'
    check 1100, 'MC'
  end

  describe 'integration tests' do
    check 190, 'CXC'
    check(1999, 'MCMXCIX')
    check(1943, 'MCMXLIII')
    check(2999, 'MMCMXCIX')
  end
end
