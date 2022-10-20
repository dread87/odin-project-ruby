require 'io/console'

class TicTacToe
  def initialize(p1, p2)
    @p1 = p1
    @p2 = p2
    @symbol = { p1 => 'X', p2 => 'O' }
  end

  def move(player)
    render("#{player}(#{@symbol[player]}), choose your position: ")
    position = gets.chomp.to_i
    while @board[position] != ' '
      render('Illegal move, choose your position again: ')
      position = gets.chomp.to_i
    end
    @board[position] = @symbol[player]
    @next = player == @p1 ? @p2 : @p1
  end

  def render(message)
    board = "#{@board[0]} | #{@board[1]} | #{@board[2]}
---------
#{@board[3]} | #{@board[4]} | #{@board[5]}
---------
#{@board[6]} | #{@board[7]} | #{@board[8]}\n\n"

    print "\e[H\e[2J"
    puts board
    print message
  end

  def play
    @board = Array.new(9).fill(' ')
    @got_winner = false
    @winner = nil
    @next = nil
    @count_moves = 0

    if rand(2) == 0
      (@first = @p1
       @next = @p2)
    else
      (@first = @p2
       @next = @p1)
    end
    print "\e[H\e[2J"
    print "#{@first}(#{@symbol[@first]}) goes first. Press any key to start."
    STDIN.getch

    move(@first)
    @count_moves += 1

    while @count_moves < 9 && @got_winner == false
      move(@next)
      @count_moves += 1
      check_winning_conditions if @count_moves > 3
    end
    @winner.nil? ? render("Draw.\n") : render("#{@winner}(#{@symbol[@winner]}) wins.\n")
  end

  def check_winning_conditions
    [[0, 1, 2], [3, 4, 5], [6, 7, 8], [0, 3, 6], [1, 4, 7], [2, 5, 8], [2, 4, 6], [0, 4, 8]].each do |combo|
      if @board[combo[0]] == @board[combo[1]] && @board[combo[1]] == @board[combo[2]] && @board[combo[0]] != ' '
        @got_winner = true
        @winner = @symbol.key(@board[combo[0]])
      end
    end
  end
end
