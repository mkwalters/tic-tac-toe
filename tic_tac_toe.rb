
class Board

  attr_accessor :board_state, :x_player, :o_player, :winner, :game_has_been_won, :current_turn, :false
  attr_reader :winning_combos

  def initialize
    $board_state = { 1 => "_", 2 => "_", 3 => "_", 4 => "_", 5 => "_", 6 => "_", 7 => "_", 8 => "_", 9 => "_"}
    @winning_combos = [ [1, 2, 3], [4, 5, 6], [7, 8, 9], [1, 4, 7], [2, 5, 8], [3, 6, 9], [1, 5, 9], [7, 5, 3] ]
    @x_player = Player.new("x")
    @o_player = Player.new("o")
    @game_has_been_won = false
    @winner = nil
    @current_turn = @x_player
    @draw = false

  end

  def check_win_condition

    winning_combos.each do |combo|
      
      if $board_state[combo[0]] == $board_state[combo[1]] && $board_state[combo[1]] == $board_state[combo[2]] && $board_state[combo[0]] != "_"
        @game_has_been_won = true
        if $board_state[combo[0]] == "x"
          @winner = @x_player
          puts "x wins"
        else
          @winner = @o_player
          puts "o wins"
        end
        #puts @winner
      end
    end

    if !@game_has_been_won
      count_for_draw = 0
      $board_state.each_value do |square|
        if square == "x" || square == "o"
          count_for_draw += 1
        end
      end
      if count_for_draw == 9
        @draw = true
        puts "its a draw!"
      end
    end
  end

  def game_loop
    while @winner == nil && @draw == false
      if @current_turn == @x_player
        puts "x to move"
        @x_player.make_move
        @current_turn = @o_player
      elsif @current_turn == @o_player
        puts "o to move"
        @o_player.make_move
        @current_turn = @x_player
      end
      check_win_condition

    end
  end

end

class Player
  attr_reader :move
  def initialize(move)
    @move = move
  end

  def make_move
    position = gets
    position = position.to_i
    if $board_state[position] == "_"
      $board_state[position] = move
    end
    #puts $board_state
  end

end

board = Board.new

board.game_loop


