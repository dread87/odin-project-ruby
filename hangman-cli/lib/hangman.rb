require 'json'
require 'io/console'

class Hangman
  MISTAKE_LIMIT = 7

  def initialize(dictionary)
    @dictionary = dictionary
  end

  def pick_random_word(dictionary)
    word = ''
    dict = File.readlines(dictionary)
    word = dict.sample.strip while word.length.between?(5, 12) == false
    word
  end

  def print_status
    print "\e[H\e[2J"
    puts "Guess the word: #{@solution.join('  ')}"
    puts "#{@mistake_count}/#{MISTAKE_LIMIT} mistakes."
  end

  def update_solution(letter)
    return unless @secret_word.include?(letter) && !@solution.include?(letter)

    index = 0
    @secret_word.each_char do |char|
      @solution[index] = letter if char == letter
      index += 1
    end
  end

  def start
    @secret_word = pick_random_word(@dictionary)
    @mistake_count = 0
    @solution = Array.new(@secret_word.length).fill('_')
    @won = false

    print "\e[H\e[2J"
    puts 'Do you wish to load a saved game ?(press Y): '
    if $stdin.getch.downcase == 'y'
      print "\e[H\e[2J"
      load_game
      print "\e[H\e[2J"
    else
      puts 'Starting a new game...'
    end

    print_status
    while @mistake_count < MISTAKE_LIMIT && !@won
      print 'Press a letter to guess or space to save: '
      player_input = $stdin.getch.downcase
      if player_input == ' '
        save_game
        next
      end
      @mistake_count += 1 unless update_solution(player_input)
      @won = true unless @solution.include?('_')
      print_status
    end
    puts "You #{@won ? 'won.' : 'lost.'}"
  end

  def save_game
    Dir.mkdir('saves') unless Dir.exist?('saves')
    save = File.open("./saves/#{Time.new.utc}.json", 'w')
    save.write(
      { 'secret_word' => @secret_word,
        'mistake_count' => @mistake_count,
        'solution' => @solution }.to_json
    )
    puts 'Saved current state.'
  end

  def load_game
    return unless Dir.exist?('saves')

    save_list = Dir.glob('saves/*.json').each_with_index { |file, index| puts "[#{index}] #{file[6..]}" }
    print 'Select which save you want to load: '
    save = save_list[Integer($stdin.getch)]

    save_data = JSON.parse(File.read(save))
    @secret_word = save_data['secret_word']
    @mistake_count = save_data['mistake_count']
    @solution = save_data['solution']
  end
end
