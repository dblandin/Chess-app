class Bishop < Piece
  def valid_move?(destination_row, destination_col)
    return false unless diagonal?(destination_row, destination_col)
    if obstructed?(destination_row, destination_col) || !obstructed?(destination_row, destination_col) && same_color?(destination_row, destination_col)
      # Move fails
      false
    elsif !obstructed?(destination_row, destination_col) && !spot_taken?(destination_row, destination_col) || !same_color?(destination_row, destination_col)
      # Move passes
      true
    end
  end
end
