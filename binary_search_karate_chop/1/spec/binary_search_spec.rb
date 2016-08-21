require_relative '../binary_search'

RSpec.describe V1::BinarySearch do
  def self.should_not_find_target(target, ordered_ints)
    it "does not find #{target} in #{ordered_ints}" do
      expect(chop(target, ordered_ints)).to eq(-1)
    end
  end

  def self.should_find_target_at(target, ordered_ints, expected_index)
    it "finds #{target} in #{ordered_ints} at position #{expected_index}" do
      expect(chop(target, ordered_ints)).to eq(expected_index)
    end
  end

  def self.check(target, ordered_ints, expected_index)
    if expected_index == -1
      should_not_find_target(target, ordered_ints)
    else
      should_find_target_at(target, ordered_ints, expected_index)
    end
  end

  def chop(target, ordered_ints)
    V1::BinarySearch.new(target, ordered_ints).chop
  end

  describe 'element is not in the array' do
    it 'does not find an index if the array is empty' do
      expect(chop(1, [])).to eq(-1)
    end

    it 'does not find the index if the element is not in an array with 2 elements' do
      expect(chop(1, [3, 6])).to eq(-1)
      expect(chop(2, [3, 6])).to eq(-1)
      expect(chop(4, [3, 6])).to eq(-1)
      expect(chop(5, [3, 6])).to eq(-1)
      expect(chop(7, [3, 6])).to eq(-1)
      expect(chop(8, [3, 6])).to eq(-1)
    end

    it 'does not find the index if the element is not in an array with 3 elements' do
      expect(chop(1, [3, 6, 7])).to eq(-1)
      expect(chop(2, [3, 6, 7])).to eq(-1)
      expect(chop(4, [3, 6, 7])).to eq(-1)
      expect(chop(5, [3, 6, 7])).to eq(-1)
      expect(chop(8, [3, 6, 7])).to eq(-1)
      expect(chop(9, [3, 6, 7])).to eq(-1)
    end
  end

  describe 'one element in the array' do
    check 3, [1], -1
    check 1, [1], 0
  end

  describe 'two elements' do
    check 1, [1, 3], 0
    check 2, [1, 3], -1
    check 3, [1, 3], 1
  end

  describe 'three elements' do
    check 1, [1, 3, 5], 0
    check 3, [1, 3, 5], 1
    check 5, [1, 3, 5], 2
    check 0, [1, 3, 5], -1
    check 2, [1, 3, 5], -1
    check 4, [1, 3, 5], -1
    check 6, [1, 3, 5], -1
  end

  describe 'five elements' do
    check 1, [1, 3, 5, 7], 0
    check 3, [1, 3, 5, 7], 1
    check 5, [1, 3, 5, 7], 2
    check 7, [1, 3, 5, 7], 3
    check 0, [1, 3, 5, 7], -1
    check 2, [1, 3, 5, 7], -1
    check 4, [1, 3, 5, 7], -1
    check 6, [1, 3, 5, 7], -1
    check 8, [1, 3, 5, 7], -1
  end
end
