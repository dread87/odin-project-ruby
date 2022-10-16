require_relative 'lib/game'

def player(number)
    puts "Player #{number}, please enter your name: "
    name = gets.chomp
end

game = TicTacToe.new(player(1), player(2))

while true
    game.play
    puts "Press Q to quit or continue by pressing any other key."                                                                                                  
    break if STDIN.getch.downcase == "q"
end