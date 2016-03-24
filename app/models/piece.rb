class Piece < ActiveRecord::Base

  belongs_to :game
  belongs_to :user, class_name: 'User'

# * Sample Chessboard *
  # 0 1 2 3 4 5 6 7
#     - - - - - - - -
# 0 | 0 1 0 0 0 1 0 0
# 1 | 0 0 0 0 0 0 0 0
# 2 | 0 0 0 0 0 0 0 0
# 3 | 0 0 0 0 0 0 0 0
# 4 | 0 0 0 0 0 0 0 0
# 5 | 0 0 0 0 0 0 0 0
# 6 | 0 0 0 0 0 0 0 0
# 7 | 0 0 0 0 0 0 0 0

    # determine if we should march forward of backwards
    # actually march forwards and backwards to build an array of spaces
    # determine if a piece is in the square from the position.


  def horizontal?(destination_row, destination_col)
  # is the row the same, but the col different?
    (current_row_index == destination_row) && (current_column_index != destination_col)
  end

  def vertical?(destination_row, destination_col)
  # is the column the same, but the row different?
    (current_column_index == destination_col) && (current_row_index != destination_row)
  end

  def diaganol?(destination_row, destination_col)
  # is the row and column different?
    (current_row_index != destination_row) && (current_column_index != destination_col)
  end

  def obstructed?(destination_row, destination_col)
    return horizontal_move(destination_row, destination_col) if horizontal?(destination_row, destination_col)
    return vertical_move(destination_row, destination_col) if vertical?(destination_row, destination_col)
    return diagonal_move(destination_row, destination_col) if diaganol?(destination_row, destination_col)
  end

  def horizontal_move(destination_row, destination_col)
    if current_column_index < destination_col
      (current_column_index + 1...destination_col).each do |col|
        return true if game.pieces.where(current_row_index: self.current_row_index, current_column_index: col).exists?
      end
    else
      current_column_index > destination_col
      (destination_col + 1...current_column_index).each do |col|
        return true if game.pieces.where(current_row_index: self.current_row_index, current_column_index: col).exists?
      end
    end
  end

  def vertical_move(destination_row, destination_col)
    if current_row_index < destination_row
      (current_row_index + 1...destination_row).each do |row|
      return true if game.pieces.where(current_row_index: row, current_column_index: self.current_column_index).exists?
      end
    else
      (destination_row + 1...current_row_index).each do |row|
      return true if game.pieces.where(current_row_index: row, current_column_index: self.current_column_index).exists?
      end
    end
  end
  
  # def diagonal_move(destination_row, destination_col)
  #     (current_row_index + 1...destination_row).each do |row|
  #       return true if game.pieces.where(current_row_index: row, current_column_index: self.current_column_index).exists?
  #     end
  #     (current_column_index + 1...destination_col).each do |col|
  #     return true if game.pieces.where(current_row_index: self.current_row_index, current_column_index: col).exists?
  #     end

    # else
    #   (destination_row + 1...current_row_index).each do |row|
    #   return true if game.pieces.where(current_row_index: row, current_column_index: self.current_column_index).exists?
    #   end
    # end

  # def valid_destination?(destination_row, destination_col)
  #   return true if game.pieces.where(current_row_index: destination_row, current_column_index: destination_col).exists?
  # end

  # def vaild_input
  # end
end
