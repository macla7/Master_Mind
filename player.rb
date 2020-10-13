# frozen_string_literal: true

# Asking Human for role and assinging
class Player
  def initialize
    @human = ''
    @comp = ''
    ask_human
  end

  def ask_human
    puts "\nWould you like to play as the 'CodeBreaker' or the 'CodeMaker'?"
    @human = gets.chomp
    human_role
  end

  def human_role
    if @human == 'CodeBreaker'
      @comp == 'CodeMaker'
    elsif @human == 'CodeMaker'
      @comp == 'CodeBreaker'
    else
      puts "\nPlease enter in one of the two options:"
      ask_human
    end
    Setup.new(@human, @comp)
  end
end

