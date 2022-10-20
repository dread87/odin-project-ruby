class Mastermind
  def initialize(digits)
    @digits = (0..digits - 1).to_a
    @permutations = @digits.permutation(4).to_a
    @last_guess = ''
  end

  def guess
    @last_guess = @permutations.sample.join('')
  end

  def determine_feedback(guess = '', permutation = '')
    feedback = [0, 0]
    (0..guess.length - 1).each do |i|
      position = permutation.index(guess[i])
      unless position.nil?
        position == i ? feedback[0] += 1 : feedback[1] += 1
      end
    end
    feedback
  end

  def trim_permutations(guess = '', feedback = [])
    (0..@permutations.length - 1).reverse_each do |i|
      @permutations.delete_at(i) if determine_feedback(@permutations[i].join(''), guess) != feedback
    end
    # p @permutations
  end

  def solution
    @permutations.sample
  end
end
