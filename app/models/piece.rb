class Piece < ActiveRecord::Base

  belongs_to :game
  belongs_to :user, class_name: 'User'

  def obstructed?(destination_row, destination_col)

    current_piece_column_index = self.current_column_index
    current_piece_row_index = self.current_row_index
    # Determine number of spaces we need to check
      row_diff = destination_row - current_piece_row_index
      col_diff = destination_col - current_piece_column_index

    #HORIZONTAL CHECK
    # spaces = []

    # while col_diff != current_piece_column_index do
    #   spaces.push(curent_piece_row_index,col_diff)
    #   col_diff -= 1
    # end

    # if current_pos = 1,1, destination is 5,1, then array is
    # spaces= [5,1], [4,1], [3,1], [2,1]
    # spaces.each do |row_index, col_index|

    # if game.pieces(row_index, col_index) != nil
    #    return true
    #  end
  # end

  end



  def horizontal_move(destination_row, destination_col)
    # current_column_index, current_row_index
    # piece = game.pieces.find_by(current_row_index, current_column_index)
    # current_column_index = destination_x
    # return game.pieces.update(current_row_index, current_column_index)
  end

  def vertical_move(destination_row, destination_col)
    # current_column_index, current_row_index
    # current_row_index = destination_y
  end

  def diagonal_move(destination_row, destination_col)
    # current_column_index, current_row_index
    # current_column_index = destination_x
    # current_row_index = destination_y
  end

  def check_destination
  end

end
