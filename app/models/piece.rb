class Piece < ActiveRecord::Base
  belongs_to :game
  belongs_to :user, class_name: 'User'

  def obstructed?(destination_row, destination_col)
    return horizontal_move(destination_row, destination_col) if horizontal?(destination_row, destination_col)
    return vertical_move(destination_row, destination_col) if vertical?(destination_row, destination_col)
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

  def horizontal_move(destination_row, destination_col)
    delta_col = current_column_index < destination_col ? 1 : -1
    current_col_position = current_column_index + delta_col

    spaces = []
    while current_col_position != destination_col do
      spaces << [destination_row, current_col_position]
      current_col_position += delta_col
    end
    check_spaces(spaces)
  end

  def vertical_move(destination_row, destination_col)
    delta_row = current_row_index < destination_row ? 1 : -1
    spaces = []

    current_row_position = current_row_index + delta_row

    while current_row_position != destination_row do
      spaces << [current_row_position, destination_col]
      current_row_position += delta_row
    end
    check_spaces(spaces)
  end

  def diagonal_move(destination_row, destination_col)
    delta_row = current_row_index < destination_row ? 1 : -1
    delta_col = current_column_index < destination_col ? 1 : -1

    spaces = []

    current_row_position = current_row_index + delta_row
    current_col_position = current_column_index + delta_col

    while current_row_position != destination_row do
      spaces << [current_row_position, current_col_position]
      current_row_position += delta_row
      current_col_position += delta_col
    end
    check_spaces(spaces)
  end

  def check_spaces(array)
    array.each do |row, col|
      return true if game.pieces.where(current_row_index: row, current_column_index: col).exists?
    end
  end 


  # def invalid_destination?(destination_row, destination_col)
  # # This has a piece in the destination, but not in between the pieces.
  # return true if game.pieces.where(current_row_index: destination_row, current_column_index: destination_col).exists?
  # end

  # def invalid_input
  #   puts "Invalid Input"
  # end
end
