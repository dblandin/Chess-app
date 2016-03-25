class Piece < ActiveRecord::Base
  belongs_to :game
  belongs_to :user, class_name: 'User'

  def obstructed?(destination_row, destination_col)
    return horizontal_move(destination_col) if horizontal?(destination_row, destination_col)
    return vertical_move(destination_row) if vertical?(destination_row, destination_col)
    return diagonal_move(destination_row, destination_col) if diaganol?(destination_row, destination_col)
  end

  def horizontal?(destination_row, destination_col)
    # given the destination row and destination col is the row the same, but the col different comparing with the current_row_index and current_column_index?
    (current_row_index == destination_row) && (current_column_index != destination_col)
  end

  def vertical?(destination_row, destination_col)
    # is the column the same, but the row different?
    (current_column_index == destination_col) && (current_row_index != destination_row)
  end

  def diaganol?(destination_row, destination_col)
    # is the row and column different?
    ((current_row_index - destination_row).abs) == ((current_column_index - destination_col).abs)
  end

  def horizontal_move(destination_col)
    if current_column_index < destination_col
      (current_column_index + 1...destination_col).each do |col|
        return true if game.pieces.where(current_row_index: current_row_index, current_column_index: col).exists?
      end
    else
      (destination_col + 1...current_column_index).each do |col|
        return true if game.pieces.where(current_row_index: current_row_index, current_column_index: col).exists?
      end
    end
  end

  # def is_empty?(row, col)
  #   return true if game.pieces.where(current_row_index: row, current_column_index: col).exists?
  # end

  def vertical_move(destination_row)
    if current_row_index < destination_row
      (current_row_index + 1...destination_row).each do |row|
        return true if game.pieces.where(current_row_index: row, current_column_index: current_column_index).exists?
      end
    else
      (destination_row + 1...current_row_index).each do |row|
        return true if game.pieces.where(current_row_index: row, current_column_index: current_column_index).exists?
      end
    end
  end

  def diagonal_move(destination_row, destination_col)
    # Create an array of in between col (col + 1...destination_col)

    # Loop through in between range of row, while incrementing row each time
    if current_row_index < destination_row && current_column_index < destination_col
        (current_row_index + 1...destination_row).each do |row|
          (current_column_index + 1...destination_col).each do |col|
        # Check to see if a piece exists in that space
          return true if game.pieces.where(current_row_index: row, current_column_index: col).exists?
          end
        end
    elsif current_row_index > destination_row && current_column_index > destination_col
        (destination_row + 1...current_row_index).each do |row|
          (destination_col + 1...current_column_index).each do |col|
        # Check to see if a piece exists in that space
          return true if game.pieces.where(current_row_index: row, current_column_index: col).exists?
          end
        end
    elsif current_row_index > destination_row && current_column_index < destination_col
      (destination_row + 1...current_row_index).each do |row|
        (current_column_index + 1...destination_col).each do |col|
        # Check to see if a piece exists in that space
        return true if game.pieces.where(current_row_index: row, current_column_index: col).exists?
        end
      end
    elsif current_row_index < destination_row && current_column_index > destination_col
      (current_row_index + 1...destination_row).each do |row|
        (destination_col + 1...current_column_index).each do |col|
        # Check to see if a piece exists in that space
        return true if game.pieces.where(current_row_index: row, current_column_index: col).exists?
        end
      end 
    end
  end

  # def valid_destination?(destination_row, destination_col)
  #   return true if game.pieces.where(current_row_index: destination_row, current_column_index: destination_col).exists?
  # end

  # def vaild_input
  # end
end
