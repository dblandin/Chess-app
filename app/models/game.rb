class Game < ActiveRecord::Base
  belongs_to :white_player, class_name: 'User'
  belongs_to :black_player, class_name: 'User'
  belongs_to :winner, class_name: 'User'
  has_many :pieces

  #after_create :populate_board!

  def populate_board!
    # this should create all 32 game pieces with their initial x/y coordinates


    # create white player pieces

    def add_pawns
    (0..7).each do |i|
      pieces.create(color: 'white', type: 'Pawn',  current_row_index: 1,
        current_column_index: i)
    end
  end
  
    add_pawns

  end

  def add_rooks
    pieces.create(color: 'white', type: 'Rook', current_row_index: 0, current_column_index: 0)
    pieces.create(color: 'white', type: 'Rook', current_row_index: 0, current_column_index: 7)
  end

  def add_knights
    pieces.create(color: 'white', type: 'Knight', current_row_index: 0, current_column_index: 1)
    pieces.create(color: 'white', type: 'Knight', current_row_index: 0, current_column_index: 6)
  end

  def add_bishops
    pieces.create(color: 'white', type: 'Bishop', current_row_index: 0, current_column_index: 2)
    pieces.create(color: 'white', type: 'Bishop', current_row_index: 0, current_column_index: 5)
  end

  
  def add_queen
    pieces.create(color: 'white', type: 'Queen', current_row_index: 0, current_column_index: 4)
  end


  def add_king
    pieces.create(color: 'white', type: 'King', current_row_index: 0, current_column_index: 3)
  end

# create black player pieces
    
         # add_pawns
  def add_pawns
    (0..7).each do |i|
      pieces.create(color: 'black', type: 'Pawn', current_row_index: 6,
        current_column_index: i)
    end
  end



 
     # add_rooks
  def add_rooks
    pieces.create(color: 'black', type: 'Rook', current_row_index: 7, current_column_index: 0)
    pieces.create(color: 'black', type: 'Rook', current_row_index: 7, current_column_index: 7)
  end
   

  def add_knights
    pieces.create(color: 'black', type: 'Knight', current_row_index: 7, current_column_index: 1)
    pieces.create(color: 'black', type: 'Knight', current_row_index: 7, current_column_index: 6)
  end

    # add_bishops

  def add_bishops
    pieces.create(color: 'black', type: 'Bishop', current_row_index: 7, current_column_index: 2)
    pieces.create(color: 'black', type: 'Bishop', current_row_index: 7, current_column_index: 5)
  end

  def add_queen
    pieces.create(color: 'black', type: 'Queen', current_row_index: 7, current_column_index: 4)
  end


  def add_king
    pieces.create(color: 'black', type: 'King', current_row_index: 7, current_column_index: 3)
  end


end


