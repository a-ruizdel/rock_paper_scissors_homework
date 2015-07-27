class GameController < ApplicationController
  # This action is for the bare domain. You can ignore it.
  def home
    redirect_to("/mockup.html")
  end

  # Your code goes below.

  def rps

    @user_move = params["the_move"]
    @computer_move = ["rock", "paper", "scissors"].sample

    if @user_move == @computer_move
      @outcome = "tied"
    elsif @user_move == "paper" && @computer_move == "rock"
      @outcome = "won"
    elsif @user_move == "paper" && @computer_move == "scissors"
      @outcome = "lost"
    elsif @user_move == "scissors" && @computer_move == "rock"
      @outcome = "lost"
    elsif @user_move == "scissors" && @computer_move == "paper"
      @outcome = "won"
    elsif @user_move == "rock" && @computer_move == "paper"
      @outcome = "lost"
    elsif @user_move == "rock" && @computer_move == "scissors"
      @outcome = "won"
    end

    m= Move.new
    m.user_move = @user_move
    m.computer_move = @computer_move

    if @outcome == "won"
      m.user_wins = 1
      m.computer_wins = 0
    elsif @outcome == "lost"
      m.user_wins = 0
      m.computer_wins = 1
    elsif @outcome == "tied"
      m.tie = 1
    else
      m.user_wins = 0
      m.computer_wins = 0
      m.tie = 0
    end

    m.save

    @all_moves = Move.all

    @count_total_moves = Move.count


    render ("games/move.html.erb")
#end
end
end
