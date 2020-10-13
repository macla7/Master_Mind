require 'pry'

class Game
  def initialize(human, comp, secret_code)
    @human = human
    @comp = comp
    @secret_code = secret_code
    @red_pegs = 0
    @white_pegs = 0
    @player_guess_store = []
    @secret_store = []
    @turn_number = 1
    @turns
    @player_guess
    start_game
  end

  def start_game
    if @human == "CodeBreaker"
      puts "\nThe game is starting. You are the CodeBreaker.\n\nGoal:\n\nYour job is to guess the 4 colours used. You must also replicate the same order. If you guess the right colour AND in the right place, you will get a red peg. If you guess the right colour, but not in the right place, you will get a white peg.\n"
      puts "\nHow many turns would you like to try and beat the AI in?\n\n"
      @turns = gets.chomp.to_i
      until (@turns.is_a? Integer) && @turns.positive?
        puts "\nPlease enter a number:\n\n"
        @turns = gets.chomp.to_i
      end
      ask_human_guess
    else
      # AI subclass
    end
  end

  def ask_human_guess
    if @turn_number <= @turns
      puts "\nPlease pick a combination of the following colours:\n red, blue, green, yellow, cyan, magenta."
      puts "\nYour guess:\n\n"
      @player_guess = gets.chomp
      verify_turn
    else
      no_more_turns
    end
  end

  def verify_turn
    @player_guess = @player_guess.downcase.gsub(',', '').split(' ')
    
    if @player_guess.length != 4
      puts "\nNOTE: Make sure you guess 4 colours, seperated by a space.\n\n"
      @player_guess = gets.chomp
      verify_turn
    end

    # Account for spelling
    @player_guess.each do |colour|
      unless Setup::COLOURS.include? colour
        ask_human_guess
      end
    end
    verify_win
  end

  def verify_win
    if @player_guess == @secret_code
      puts "\nCongrats, you've won big sir!\n\n"
    else
      red_peg
    end
  end

  def red_peg
    4.times do |i|
      if @player_guess[i] == @secret_code[i]
        @red_pegs += 1
      else
        @player_guess_store.push(@player_guess[i])
        @secret_store.push(@secret_code[i])
      end
    end
    white_peg
  end

  def white_peg
    @secret_store.each do |colour|
      if @player_guess_store.include? (colour)
        @white_pegs += 1
      end
    end
    finish_turn
  end

  def finish_turn
    puts "\nYou got:\n##{@red_pegs} Red Pegs \n##{@white_pegs} White Pegs"
    @turn_number += 1
    ask_human_guess
  end

  def no_more_turns
    puts "\nsorry gg bro.\n\n"
  end
end
