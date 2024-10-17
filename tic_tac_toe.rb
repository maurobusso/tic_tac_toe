  # 0 | 1 | 2
  # ---------
  # 3 | 4 | 5
  # ---------
  # 6 | 7 | 8

class Game
  attr_accessor :x_mask
  attr_accessor :o_mask
  attr_reader :winning_combinations
  attr_reader :full_board
  attr_accessor :board_state

def initialize
  @winning_combinations = [
    0b111000000,
    0b000111000,
    0b000000111,
    0b100100100,
    0b010010010,
    0b001001001,
    0b100010001,
    0b001010100
]
  @full_board = 111111111

  @x_mask = 0b000000000
  @o_mask = 0b000000000
  @board_state = 0b000000000
end

  def update_board_state
    @board_state = @x_mask | @o_mask
  end

  def make_move(player, square)
    if check_valid_move(player, square)
      move = 1 << square  # Create the bitmask for the current move
      # places a one in the square position 000000100 ex

      if player == 'X'
        @x_mask = @x_mask | move
        move = 0b000000000
      elsif player == 'O'
        @o_mask = @o_mask | move
        move = 0b000000000
      end
    end
    update_board_state
    check_win
  end

    def check_valid_move(player, square)
      # valid square input
      if square > 8 || square < 0
        p "sorry this square doesn't exist"
        return
      end

      # right symbol input by player
      if player != 'O' && player != 'X'
        p "You can only pick between X and O"
        return
      end

      # the square is not alredy occupied
      if board_state & (1 << square) != 0
        p "Square alredy occupied"
        return
      end

    true
  end

  def check_win()
    if @winning_combinations.include?(@x_mask)
      p 'X is the winner'
      return
    elsif @winning_combinations.include?(@o_mask)
      p 'O is the winner'
      return
    elsif (@x_mask | @o_mask) == @full_board
      p "It's a draw!!"
    end
  end

end

game = Game.new

game.make_move('X', 0)
game.make_move('O', 1)
game.make_move('X', 2)
game.make_move('O', 3)
game.make_move('X', 5)


p game.board_state
