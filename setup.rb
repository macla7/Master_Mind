# frozen_string_literal: true

class Setup
  COLOURS = %w[red green blue yellow cyan magenta].freeze

  def initialize(human, comp)
    @human = human
    @comp = comp
    @secret_code = []
    if @human == 'CodeMaker'
      make_secret_code
    elsif @human == 'CodeBreaker'
      generate_secret_code
    else
      puts 'error in init'
    end
  end

  def make_secret_code
    puts "\nPlease enter a combination of 4 of the below colours\n
          #{COLOURS}:\n\n"
    @secret_code = gets.chomp.split
    start_game
  end

  def generate_secret_code
    4.times do
      @secret_code.push(COLOURS[rand(0..5)])
    end
    start_game
  end

  def start_game
    Game.new(@human, @comp, @secret_code)
  end
end

