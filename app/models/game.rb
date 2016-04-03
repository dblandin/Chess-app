class Game < ActiveRecord::Base
  belongs_to :white_player, class_name: 'User'
  belongs_to :black_player, class_name: 'User'
  belongs_to :winner, class_name: 'User'
  has_many :pieces
  after_create :populate_board!

  def open_seat?
    white_player_id.nil? || black_player_id.nil?
  end

  def set_captured_to_false
    pieces.each do |piece|
      piece.update_attributes(captured: false)
    end
  end

  def populate_board! # rubocop:disable Metrics/AbcSize
    (0..7).each do |i|
      pieces.create(color: 'white', type: 'Pawn', current_row_index: 1,
                    current_column_index: i)
    end

    pieces.create(color: 'white', type: 'Rook', current_row_index: 0, current_column_index: 0)
    pieces.create(color: 'white', type: 'Rook', current_row_index: 0, current_column_index: 7)

    pieces.create(color: 'white', type: 'Knight', current_row_index: 0, current_column_index: 1)
    pieces.create(color: 'white', type: 'Knight', current_row_index: 0, current_column_index: 6)

    pieces.create(color: 'white', type: 'Bishop', current_row_index: 0, current_column_index: 2)
    pieces.create(color: 'white', type: 'Bishop', current_row_index: 0, current_column_index: 5)

    pieces.create(color: 'white', type: 'Queen', current_row_index: 0, current_column_index: 4)

    pieces.create(color: 'white', type: 'King', current_row_index: 0, current_column_index: 3)

    (0..7).each do |i|
      pieces.create(color: 'black', type: 'Pawn', current_row_index: 6,
                    current_column_index: i)
    end

    pieces.create(color: 'black', type: 'Rook', current_row_index: 7, current_column_index: 0)
    pieces.create(color: 'black', type: 'Rook', current_row_index: 7, current_column_index: 7)

    pieces.create(color: 'black', type: 'Knight', current_row_index: 7, current_column_index: 1)
    pieces.create(color: 'black', type: 'Knight', current_row_index: 7, current_column_index: 6)

    pieces.create(color: 'black', type: 'Bishop', current_row_index: 7, current_column_index: 2)
    pieces.create(color: 'black', type: 'Bishop', current_row_index: 7, current_column_index: 5)

    pieces.create(color: 'black', type: 'Queen', current_row_index: 7, current_column_index: 4)

    pieces.create(color: 'black', type: 'King', current_row_index: 7, current_column_index: 3)
  end
end
