class Queen < Piece

  def valid_move?(destination_row, destination_col)
    !same_color?(destination_row, destination_col) &&
    !invalid_input?(destination_row, destination_col) &&
    valid_piece_move?(destination_row, destination_col)
  end
    
  def valid_piece_move?(destination_row, destination_col)
    horizontal?(destination_row, destination_col) ||
      vertical?(destination_row, destination_col) ||
      diagonal?(destination_row, destination_col)
  end

end
