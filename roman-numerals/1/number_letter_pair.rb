module V1
class NumberLetterPair
  attr_reader :number, :letter

  def initialize(number, letter)
    @number = number
    @letter = letter
  end

  def to_s
    "#{number}=#{letter}"
  end
end
end
