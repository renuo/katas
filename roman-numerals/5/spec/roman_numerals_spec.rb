require_relative '../roman_numerals_converter'

describe RomanNumeralsConverter do
  def self.check_indices(from, method, offsets=[0])
    offsets.each do |offset|
      (0..9).each do |factor|
        from_with_factor_and_offset = from * factor + offset
        it "#{method}_index with #{from_with_factor_and_offset} to #{factor}" do
          converter = RomanNumeralsConverter.new(from_with_factor_and_offset)
          expect(converter.send("#{method}_index")).to eq(factor)
        end
      end
    end
  end

  def self.check(expression)
    expression.split(' ').map do |sub_expression|
      number, letter = sub_expression.split('=')
      it "converts #{number} to #{letter}" do
        converter = RomanNumeralsConverter.new(number.to_i)
        expect(converter.to_roman).to eq(letter)
      end
    end
  end

  describe 'one to ten' do
    check '1=I 2=II 3=III 9=IX'
    check_indices 1, 'ones', [0, 10, 100, 1000, 1110]
  end

  describe 'ten to ninety' do
    check_indices 10, 'tens', [0, 3, 9, 100, 1000, 1100]
  end

  describe 'hundred to nine hundred' do
    check_indices 100, 'hundreds', [0, 10, 90, 99, 1000]
  end

  describe 'thousand to three thousand' do
    check_indices 1000, 'thousands', [0, 10, 90, 399]
  end

  describe 'check combination' do
    it 'concats the numbers correctly' do
      converter = RomanNumeralsConverter.new(-1)
      expect(converter).to receive(:thousands).and_return('1000-')
      expect(converter).to receive(:hundreds).and_return('100-')
      expect(converter).to receive(:tens).and_return('10-')
      expect(converter).to receive(:ones).and_return('1')
      expect(converter.to_roman).to eq('1000-100-10-1')
    end
  end

  describe 'integration tests' do
    check '190=CXC 1999=MCMXCIX 1943=MCMXLIII 2999=MMCMXCIX'
  end
end
