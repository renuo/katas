require_relative '../virtual_array'

RSpec.describe V6::VirtualArray do
  describe 'the empty array' do
    subject { V6::VirtualArray.new([]) }

    it { expect(subject.length).to be(0) }
    it { expect { subject[0] }.to raise_exception(IndexError) }
    it { expect { subject.remove_left_half }.to raise_exception(IndexError) }
    it { expect { subject.remove_right_half }.to raise_exception(IndexError) }
    it { expect { subject.middle_element }.to raise_exception(IndexError) }
  end

  describe 'array with 1 element' do
    subject { V6::VirtualArray.new([42]) }

    it { expect(subject.length).to be(1) }

    it { expect(subject[0]).to be(42) }

    it { expect(subject.middle_element).to eq(42) }

    it 'removes the left half' do
      subject.remove_left_half
      expect(subject.length).to be(0)
      expect { subject[0] }.to raise_exception(IndexError)
    end

    it 'removes the right half' do
      subject.remove_right_half
      expect(subject.length).to be(0)
      expect { subject[0] }.to raise_exception(IndexError)
    end
  end

  describe 'array with two elements' do
    subject { V6::VirtualArray.new([10, 42]) }

    it { expect(subject.length).to be(2) }

    it { expect(subject[0]).to be(10) }
    it { expect(subject[1]).to be(42) }

    it { expect(subject.middle_element).to eq(10) }

    it 'removes the left half' do
      subject.remove_left_half
      expect(subject.length).to be(1)
      expect(subject[0]).to be(42)
      expect { subject[1] }.to raise_exception(IndexError)
    end

    it 'removes the left half two times' do
      2.times { subject.remove_left_half }
      expect(subject.length).to be(0)
      expect { subject[0] }.to raise_exception(IndexError)
    end

    it 'removes the right half' do
      subject.remove_right_half
      expect(subject.length).to be(1)
      expect(subject[0]).to be(10)
      expect { subject[1] }.to raise_exception(IndexError)
    end

    it 'removes the right half two times' do
      2.times { subject.remove_right_half }
      expect(subject.length).to be(0)
      expect { subject[0] }.to raise_exception(IndexError)
    end

    it 'removes the left, then the right half' do
      subject.remove_left_half
      subject.remove_right_half
      expect(subject.length).to be(0)
      expect { subject[0] }.to raise_exception(IndexError)
    end

    it 'removes the right, then the left half' do
      subject.remove_right_half
      subject.remove_left_half
      expect(subject.length).to be(0)
      expect { subject[0] }.to raise_exception(IndexError)
    end
  end

  describe 'array with three elements' do
    subject { V6::VirtualArray.new([10, 42, 53]) }

    it { expect(subject.length).to be(3) }

    it { expect(subject[0]).to be(10) }
    it { expect(subject[1]).to be(42) }
    it { expect(subject[2]).to be(53) }

    it { expect(subject.middle_element).to eq(42) }

    it 'removes the left half' do
      subject.remove_left_half
      expect(subject.length).to be(1)
      expect(subject[0]).to be(53)
      expect { subject[1] }.to raise_exception(IndexError)
    end

    it 'removes the left half two times' do
      2.times { subject.remove_left_half }
      expect(subject.length).to be(0)
      expect { subject[0] }.to raise_exception(IndexError)
    end

    it 'removes the right half' do
      subject.remove_right_half
      expect(subject.length).to be(1)
      expect(subject[0]).to be(10)
      expect { subject[1] }.to raise_exception(IndexError)
    end

    it 'removes the right half two times' do
      2.times { subject.remove_right_half }
      expect(subject.length).to be(0)
      expect { subject[0] }.to raise_exception(IndexError)
    end

    it 'removes the left, then the right half' do
      subject.remove_left_half
      subject.remove_right_half
      expect(subject.length).to be(0)
      expect { subject[0] }.to raise_exception(IndexError)
    end

    it 'removes the right, then the left half' do
      subject.remove_right_half
      subject.remove_left_half
      expect(subject.length).to be(0)
      expect { subject[0] }.to raise_exception(IndexError)
    end
  end

  describe 'array with four elements' do
    subject { V6::VirtualArray.new([10, 42, 53, 81]) }

    it { expect(subject.length).to be(4) }

    it { expect(subject[0]).to be(10) }
    it { expect(subject[1]).to be(42) }
    it { expect(subject[2]).to be(53) }
    it { expect(subject[3]).to be(81) }

    it { expect(subject.middle_element).to eq(42) }

    it 'removes the left half' do
      subject.remove_left_half
      expect(subject.length).to be(2)
      expect(subject[0]).to be(53)
      expect(subject[1]).to be(81)
      expect { subject[2] }.to raise_exception(IndexError)
    end

    it 'removes the left half two times' do
      2.times { subject.remove_left_half }
      expect(subject.length).to be(1)
      expect(subject[0]).to be(81)
      expect { subject[1] }.to raise_exception(IndexError)
    end

    it 'removes the right half' do
      subject.remove_right_half
      expect(subject.length).to be(2)
      expect(subject[0]).to be(10)
      expect(subject[1]).to be(42)
      expect { subject[2] }.to raise_exception(IndexError)
    end

    it 'removes the right half two times' do
      2.times { subject.remove_right_half }
      expect(subject.length).to be(1)
      expect(subject[0]).to be(10)
      expect { subject[1] }.to raise_exception(IndexError)
    end

    it 'removes the left, then the right half' do
      subject.remove_left_half
      subject.remove_right_half
      expect(subject.length).to be(1)
      expect(subject[0]).to be(53)
      expect { subject[1] }.to raise_exception(IndexError)
    end

    it 'removes the right, then the left half' do
      subject.remove_right_half
      subject.remove_left_half
      expect(subject.length).to be(1)
      expect(subject[0]).to be(42)
      expect { subject[1] }.to raise_exception(IndexError)
    end
  end

  describe 'integration tests' do
    subject { V6::VirtualArray.new([1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15]) }

    it 'removes left, left, right, left' do
      expect(subject.length).to be(15)
      expect(subject[0]).to be(1)
      expect(subject.middle_element).to eq(8)

      subject.remove_left_half
      expect(subject.length).to be(7)
      expect(subject[0]).to be(9)
      expect(subject.middle_element).to eq(12)

      subject.remove_left_half
      expect(subject.length).to be(3)
      expect(subject[0]).to be(13)
      expect(subject.middle_element).to eq(14)

      subject.remove_right_half
      expect(subject.length).to be(1)
      expect(subject[0]).to be(13)
      expect(subject.middle_element).to eq(13)

      subject.remove_left_half
      expect(subject.length).to be(0)
    end

    it 'removes right, left, right, left' do
      expect(subject.length).to be(15)
      expect(subject[0]).to be(1)
      subject.remove_right_half
      expect(subject.length).to be(7)
      expect(subject[0]).to be(1)
      subject.remove_left_half
      expect(subject.length).to be(3)
      expect(subject[0]).to be(5)
      subject.remove_right_half
      expect(subject.length).to be(1)
      expect(subject[0]).to be(5)
      subject.remove_left_half
      expect(subject.length).to be(0)
    end
  end
end
