class Lottery
  def initialize(prizewinners)
    @prizewinners = prizewinners
    @candidates = []
    @weight_map = {}
  end

  def add(candidate, weight)
    @candidates << candidate
    @weight_map[@candidates.size - 1] = weight
  end

  def winners
    numbers = [].tap {|arr|
      @prizewinners.times { arr << rand(@prizewinners) }
    }
    @candidates.values_at(*numbers)
  end
end
