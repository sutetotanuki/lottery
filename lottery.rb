class Lottery
  def initialize(max)
    @max             = max
    @candidate_table = {}
    @entropy         = 0
  end

  def add(candidate, weight)
    raise ArgumentError, "Weight must be greater than 0" if weight < 1
    
    @candidate_table[candidate] = weight
    @entropy += weight
  end

  def elect_candidate(entropy, candidate_table)
    # This method allow to be received with twice.
    candidate_table = candidate_table.dup
    
    result = []
    
    @max.times do
      rand_val = rand(1..entropy)
      
      x = 0
      
      candidate_table.each do |candidate, weight|
        x += weight

        if x >= rand_val
          result << candidate
          entropy -= weight
          candidate_table.delete(candidate)
          break
        end
      end
      
    end

    result
  end

  def winners
    elect_candidate(@entropy, @candidate_table)
  end
end
