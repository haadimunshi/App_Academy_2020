class Code
  POSSIBLE_PEGS = {
    "R" => :red,
    "G" => :green,
    "B" => :blue,
    "Y" => :yellow
  }

  def self.valid_pegs?(chars)
    chars.each do |char|
      if !POSSIBLE_PEGS.keys.include?(char.upcase)
        return false
      end
    end
    true
  end

  def self.random(length)
    random_pegs = Array.new(length, POSSIBLE_PEGS.keys.sample)
    Code.new(random_pegs)
  end

  def self.from_string(str)
    Code.new(str.split(""))
  end

  attr_reader :pegs

  def initialize(chars)
    if !Code.valid_pegs?(chars)
      raise "invalid pegs"
    else
      @pegs = []
      chars.map { |char| @pegs << char.upcase }
    end
  end

  def [](i)
    @pegs[i]
  end

  def length
    @pegs.length
  end

  def num_exact_matches(guess)
    count = 0
    guess.pegs.map.with_index do |char, i|
      if char == @pegs[i]
        count += 1
      end
    end
    count
  end

  def num_near_matches(guess)
    count = 0
    guess.pegs.map.with_index do |char, i|
      if @pegs.include?(char) && char != @pegs[i]
        count += 1
      end
    end
    count
  end

  def ==(code)
    code.pegs == self.pegs
  end

end
