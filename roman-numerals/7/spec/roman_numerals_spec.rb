require_relative '../roman_numerals_converter'

RSpec.describe V7::RomanNumeralsConverter do
  def self.check_single_to_roman(number, roman)
    it "converts #{number} to #{roman}" do
      converter = V7::RomanNumeralsConverter.new(number)
      expect(converter.to_roman).to eq(roman)
    end
  end

  def self.check(chain_of_assertions)
    chain_of_assertions.split(' ').each do |assertion|
      number, roman = assertion.split('=')
      check_single_to_roman(number.to_i, roman)
    end
  end

  describe 'the ones' do
    check('1=I 2=II 3=III 4=IV 5=V 6=VI 7=VII 8=VIII 9=IX')
  end

  describe 'the tens' do
    check('10=X 20=XX 30=XXX 40=XL 50=L 60=LX 70=LXX 80=LXXX 90=XC')
  end

  describe 'the hundreds' do
    check('100=C 200=CC 300=CCC 400=CD 500=D 600=DC 700=DCC 800=DCCC 900=CM')
  end

  describe 'the thousands' do
    check('1000=M 2000=MM 3000=MMM')
  end

  describe 'the combinations' do
    check('11=XI 19=XIX 85=LXXXV 99=XCIX 999=CMXCIX 518=DXVIII 101=CI 888=DCCCLXXXVIII 3888=MMMDCCCLXXXVIII')
  end
end
