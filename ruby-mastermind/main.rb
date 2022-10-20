require_relative 'lib/mastermind'
require 'io/console'

class Game
  def initialize(digits)
    @turns = 12
    @digits = digits
    @game = Mastermind.new(@digits)
    @feedback = []
  end

  def mastermind
    print 'Think of a number then press any key to start.'
    $stdin.getch
    begin
      (1..@turns).each do |i|
        guess = @game.guess
        print "\nComputer guessed #{guess}.\nCorrect digits clue: "
        @feedback[0] = Integer(gets.chomp)
        if @feedback[0] == 4
          puts "Computer won in #{i} guesses!"
          break
        end
        print 'Misplaced digits clue: '
        @feedback[1] = Integer(gets.chomp)
        @game.trim_permutations(guess, @feedback)
      end
    rescue StandardError => e
      puts e
      puts 'You probably gave the computer wrong clues.'
    end
  end

  def codebreaker
    solution = @game.solution
    (1..12).each do |_i|
      print 'Enter your guess: '
      guess = gets.chomp

      if guess != solution.join('')
        feedback = @game.determine_feedback(guess, solution.join(''))
        puts "Wrong. Your clue is: #{feedback[0]} correct digits, #{feedback[1]} misplaced digits."
      else
        puts 'Correct guess. You won.'
        break
      end
      if _i != 12
        puts "You have #{12 - _i} guesses left."
      else
        puts "You ran out of guesses. Solution was #{solution.join('')}"
      end
    end
  end
end

print "Choose the game mode:\n1)Mastermind 2)Codebreaker\nChoice: "
game_mode = gets.chomp

while game_mode != '1' && game_mode != '2'
    print 'Try again: '
    game_mode = gets.chomp
end

print "\e[H\e[2J"
print "How many digits(4-9) do you want to be used ? "
digits = Integer(gets.chomp)
while digits < 4 || digits > 9
  puts "Invalid input. It must be a number between 4 to 9"
  digits = Integer(gets.chomp)
end
puts "The digits #{(0..digits-1).to_a} will be used."

play = Game.new(digits)
case game_mode
when '1'
  play.mastermind
when '2'
  play.codebreaker
end