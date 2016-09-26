require_relative '../reverse_roman_numerals_converter'

RSpec.describe V5::ReverseRomanNumeralsConverter do
  def self.check(letter, number)
    it "converts #{letter} to #{number}" do
      converter = described_class.new(letter)
      expect(converter.to_numeral).to eq(number)
      expect(converter.to_numeral).to eq(number)
    end
  end

  def self.multi_check(checks)
    checks.split(' ').each do |number_letter|
      number, letter = number_letter.split('=')
      check(letter, number.to_i)
    end
  end

  describe 'single letters' do
    check('I', 1)
    check('II', 2)
    check('III', 3)
    check('IV', 4)
    check('V', 5)
    check('VI', 6)
    check('VII', 7)
    check('VIII', 8)
    check('IX', 9)
  end

  describe 'tens' do
    check('X', 10)
    check('XI', 11)
    check('XII', 12)
    check('XIII', 13)
    check('XIV', 14)
    check('XV', 15)
    check('XVI', 16)
    check('XVII', 17)
    check('XVIII', 18)
    check('XIX', 19)
    check('XX', 20)
    check('XXX', 30)
    check('XXXIX', 39)
    check('XL', 40)
    check('L', 50)
    check('LX', 60)
    check('LXX', 70)
    check('LXXX', 80)
    check('XC', 90)
  end

  describe 'hundreds' do
    check('C', 100)
    check('CC', 200)
    check('CCC', 300)
    check('CD', 400)
    check('D', 500)
    check('DC', 600)
    check('DCC', 700)
    check('DCCC', 800)
    check('CM', 900)
  end

  describe 'thousands' do
    check('MM', 2000)
    check('MMM', 3000)
  end

  describe 'integration tests' do
    multi_check('11=XI 19=XIX 85=LXXXV 99=XCIX 999=CMXCIX 518=DXVIII 101=CI 888=DCCCLXXXVIII 3888=MMMDCCCLXXXVIII')
    multi_check('990=CMXC 991=CMXCI 909=CMIX')
  end
end
