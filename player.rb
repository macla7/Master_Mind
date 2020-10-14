# frozen_string_literal: true

# Asking Human for role and assinging
class Player
  def initialize
    @human = ''
    @comp = ''
    ask_human
  end

  def ask_human
    puts "\nWould you like to play as the 'CodeBreaker' or the 'CodeMaker'?\n\n"
    @human = gets.chomp.downcase
    human_role
  end

  def human_role
    if @human == 'codebreaker'
      @comp = 'CodeMaker'
      @human = 'CodeBreaker'
    elsif @human == 'codemaker'
      @comp = 'CodeBreaker'
      @human = 'CodeMaker'
    else
      puts "\nPlease enter in one of the two options:"
      ask_human
    end
    Setup.new(@human, @comp)
  end
end

