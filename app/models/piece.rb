class Piece < ActiveRecord::Base
  belongs_to :game
  belongs_to :user, class_name: 'User'

  def obstructed?(destination_row, destination_col)
    invalid_input?(destination_row, destination_col) ||
      invalid_horizontal_move?(destination_row, destination_col) ||
      invalid_vertical_move?(destination_row, destination_col) ||
      invalid_diagonal_move?(destination_row, destination_col) ||
      spot_taken?(destination_row, destination_col)
  end

  def horizontal?(destination_row, destination_col)
    # Is the row the same, but the column different?
    (current_row_index == destination_row) && (current_column_index != destination_col)
  end

  def vertical?(destination_row, destination_col)
    # is the column the same, but the row different?
    (current_column_index == destination_col) && (current_row_index != destination_row)
  end

  def diagonal?(destination_row, destination_col)
    # is the row and column different?
    (current_row_index - destination_row).abs == (current_column_index - destination_col).abs
  end

  def invalid_horizontal_move?(destination_row, destination_col)
    return false unless horizontal?(destination_row, destination_col)
    delta_col = current_column_index < destination_col ? 1 : -1
    current_col_position = current_column_index + delta_col
    spaces = []

    while current_col_position != destination_col
      spaces << [destination_row, current_col_position]
      current_col_position += delta_col
    end
    piece_present?(spaces)
  end

  def invalid_vertical_move?(destination_row, destination_col)
    return false unless vertical?(destination_row, destination_col)
    delta_row = current_row_index < destination_row ? 1 : -1
    current_row_position = current_row_index + delta_row
    spaces = []

    while current_row_position != destination_row
      spaces << [current_row_position, destination_col]
      current_row_position += delta_row
    end
    piece_present?(spaces)
  end

  def invalid_diagonal_move?(destination_row, destination_col)
    return false unless diagonal?(destination_row, destination_col)
    delta_row = current_row_index < destination_row ? 1 : -1
    delta_col = current_column_index < destination_col ? 1 : -1
    spaces = []

    current_row_position = current_row_index + delta_row
    current_col_position = current_column_index + delta_col

    while current_row_position != destination_row
      spaces << [current_row_position, current_col_position]
      current_row_position += delta_row
      current_col_position += delta_col
    end
    piece_present?(spaces)
  end

  def piece_present?(array)
    return false if array.empty?
    array.map do |row, col|
      game.pieces.where(current_row_index: row, current_column_index: col)
    end.inject(&:or).count > 0
  end

  def invalid_input?(destination_row, destination_col)
    destination_row > 7 || destination_col > 7
  end

  def spot_taken?(destination_row, destination_col)
    # # This has a piece in the destination, but not in between the pieces.
    game.pieces.where(current_row_index: destination_row, current_column_index: destination_col).count > 0
  end

  def move_to!(destination_row, destination_col)
    # logic here
    #   First, check to see if there is a piece in the location it’s moving to.
    if spot_taken?(destination_row, destination_col)
      blocker_piece = game.pieces.find_by_current_row_index_and_current_column_index(destination_row, destination_col)
      #If the piece here is of Opposite color and not obstructed, remove the piece else the move should fail
      if self.color != blocker_piece.color && obstructed?(destination_row, destination_col) == false
        # Remove the old piece
        blocker_piece.update_attributes(current_row_index: nil, current_column_index: nil, captured: true)
        # Place piece in the removed pieces location
        self.update_attributes(current_row_index: destination_row, current_column_index: destination_col)
      else
        # Move should fail
      end
    else
      # There is not a piece in the spot so check the obstructions next
      if obstructed?(destination_row, destination_col) == false
        # move the piece to the location
        self.update_attributes(current_row_index: destination_row, current_column_index: destination_col)
      else
        # Move should fail
      end
    end
    #   Second, if there is a piece there, and it’s the opposing color, remove the piece from the board. This can be done a few different ways.

    #   You could have a “status” flag on the piece that will be one of “onboard” or “captured”.
    #   You could set the piece’s x/y coordinates to nil
    #   You could delete the item from the database.
    #   Each solution has pros/cons. It's up to you smile!

    #   Third, if the piece is there and it’s the same color the move should fail - it should either raise an error message or do nothing.

    #   Finally, it should call update_attributes on the piece and change the piece’s x/y position (move the piece).
  end
end
