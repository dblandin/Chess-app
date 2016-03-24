class Game < ActiveRecord::Base
  belongs_to :white_player, class_name: 'User'
  belongs_to :black_player, class_name: 'User'
  belongs_to :winner, class_name: 'User'
  has_many :pieces

  after_create :populate_board!

  def populate_board!
    # this should create all 32 game pieces with their initial x/y coordinates

    # create black player pieces
    
     add_pawns
     # add_rooks
     # add_bishops
     # add_knights
     # add_queens
     # add_kings




    # create white player pieces


  end


  def add_pawns
    (0..7).each do |i|
      Pawn.create (
        game_id: id,
        current_row_index: 1,
        current_column_index: i

        )
    end
  end


  
end


