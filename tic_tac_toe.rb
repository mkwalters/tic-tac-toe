
class Board

  attr_accessor :board_state, :x_player, :o_player
  attr_reader :winning_combos

  def initialize
    $board_state = { 1 => "_", 2 => "_", 3 => "_", 4 => "_", 5 => "_", 6 => "_", 7 => "_", 8 => "_", 9 => "_"}
    @winning_combos = [ [1, 2, 3], [4, 5, 6], [7, 8, 9], [1, 4, 7], [2, 5, 8], [3, 6, 9], [1, 5, 9], [7, 5, 3] ]
    @x_player = Player.new("x")
    @o_player = Player.new("o")
  end

  def check_win_condition
    victory = false

    winning_combos.each do |combo|
      
      if $board_state[combo[0]] == $board_state[combo[1]] && $board_state[combo[1]] == $board_state[combo[2]] && $board_state[combo[0]] != "_"
        victory = true
        puts "I detected a win"
        return victory
      end

    end
  end
end

class Player
  attr_reader :move
  def initialize(move)
    @move = move
  end

  def make_move(position) # write a recursive to keep going until they give valid move
    if $board_state[position] == "_"
      $board_state[position] = move
    end
  end

end


board = Board.new
board.x_player.make_move(4)
board.x_player.make_move(5)
board.x_player.make_move(6)

board.check_win_condition

