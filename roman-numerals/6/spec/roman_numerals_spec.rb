require_relative '../roman_numerals_converter'

RSpec.describe V6::RomanNumeralsConverter do
  def self.check(expression)
    expression.split(' ').map do |sub_expression|
      number, letter = sub_expression.split('=')
      it "converts #{number} to #{letter}" do
        converter = V6::RomanNumeralsConverter.new(number.to_i)
        expect(converter.to_roman).to eq(letter)
      end
    end
  end

  describe 'one to nine' do
    check '1=I 2=II 3=III 4=IV 5=V 6=VI 7=VII 8=VIII 9=IX'
  end

  describe 'ten to ninety' do
    check '10=X 20=XX 30=XXX 40=XL 50=L 60=LX 70=LXX 80=LXXX 90=XC'
  end

  describe 'hundred to nine hundred' do
    check '100=C 200=CC 300=CCC 400=CD 500=D 600=DC 700=DCC 800=DCCC 900=CM'
  end

  describe 'one thousand to three thousand' do
    check '1000=M 2000=MM 3000=MMM'
  end

  describe 'integration tests' do
    check '190=CXC 1999=MCMXCIX 1943=MCMXLIII 2999=MMCMXCIX'
  end
end
