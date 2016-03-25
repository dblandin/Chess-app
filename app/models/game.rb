class Game < ActiveRecord::Base
  belongs_to :white_player, class_name: 'User'
  belongs_to :black_player, class_name: 'User'
  belongs_to :winner, class_name: 'User'
  has_many :pieces

  #after_create :populate_board!

  def populate_board!
    # this should create all 32 game pieces with their initial x/y coordinates
    # add_pawns
    # add_rooks
    # add_knights
    # add_bishops
    # add_queen
    # add_king
  end

    # create white player pieces

    def add_pawns_white
      (0..7).each do |i|
        pieces.create(color: 'white', type: 'Pawn',  current_row_index: 1,
        current_column_index: i)
      end
       # (0..7).each do |i|
       #  pieces.create(color: 'black', type: 'Pawn', current_row_index: 6,
       #    current_column_index: i)
      # end
    end
  
   



    def add_rooks_white
      pieces.create(color: 'white', type: 'Rook', current_row_index: 0, current_column_index: 0)
      pieces.create(color: 'white', type: 'Rook', current_row_index: 0, current_column_index: 7)
    end
  

    def add_knights_white
      pieces.create(color: 'white', type: 'Knight', current_row_index: 0, current_column_index: 1)
      pieces.create(color: 'white', type: 'Knight', current_row_index: 0, current_column_index: 6)
    end
    

    def add_bishops_white
      pieces.create(color: 'white', type: 'Bishop', current_row_index: 0, current_column_index: 2)
      pieces.create(color: 'white', type: 'Bishop', current_row_index: 0, current_column_index: 5)
    end
    

    
    def add_queen_white
      pieces.create(color: 'white', type: 'Queen', current_row_index: 0, current_column_index: 4)
    end
   


    def add_king_white
      pieces.create(color: 'white', type: 'King', current_row_index: 0, current_column_index: 3)
    end
 

  # create black player pieces
      

    def add_pawns_black
      (0..7).each do |i|
        pieces.create(color: 'black', type: 'Pawn', current_row_index: 6,
          current_column_index: i)
      end
    end



   
       # add_rooks
    def add_rooks_black
      pieces.create(color: 'black', type: 'Rook', current_row_index: 7, current_column_index: 0)
      pieces.create(color: 'black', type: 'Rook', current_row_index: 7, current_column_index: 7)
    end
     

    def add_knights_black
      pieces.create(color: 'black', type: 'Knight', current_row_index: 7, current_column_index: 1)
      pieces.create(color: 'black', type: 'Knight', current_row_index: 7, current_column_index: 6)
    end

      # add_bishops

    def add_bishops_black
      pieces.create(color: 'black', type: 'Bishop', current_row_index: 7, current_column_index: 2)
      pieces.create(color: 'black', type: 'Bishop', current_row_index: 7, current_column_index: 5)
    end

    def add_queen_black
      pieces.create(color: 'black', type: 'Queen', current_row_index: 7, current_column_index: 4)
    end


    def add_king_black
      pieces.create(color: 'black', type: 'King', current_row_index: 7, current_column_index: 3)
    end


end


