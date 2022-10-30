require './lib/hangman'
require 'io/console'

hangman = Hangman.new('google-10000-english-no-swears.txt')

loop do
  hangman.start
  print 'Press enter to play again.'
  break if $stdin.getch != "\r"
end
