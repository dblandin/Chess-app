class Game < ActiveRecord::Base
  belongs_to :white_player, class_name: 'User'
  belongs_to :black_player, class_name: 'User'
  belongs_to :winner, class_name: 'User'
  has_many :pieces

  after_create :populate_board!
  #, :only => [:create]

  # def pieces 
  #   @pieces = Piece.new
  # end

  def populate_board!
    # this should create all 32 game pieces with their initial x/y coordinates
    # add_pawns_white
    # add_pawns_black
    # add_rooks_white
    # add_pawns_black
    # add_knights_white
    # add_knights_black
    # add_bishops_white
    # add_bishops_black
    # add_queen_white
    # add_queen_black
    # add_king_white
    # add_king_black
    #def add_pawns_white

 # create white player pieces
      (0..7).each do |i|
        Pawn.create(color: 'white', type: 'Pawn',  current_row_index: 1,
        current_column_index: i)
      end
    #end
  
   



    #def add_rooks_white
      Rook.create(color: 'white', type: 'Rook', current_row_index: 0, current_column_index: 0)
      Rook.create(color: 'white', type: 'Rook', current_row_index: 0, current_column_index: 7)
    #end
  
    #def add_knights_white
      Knight.create(color: 'white', type: 'Knight', current_row_index: 0, current_column_index: 1)
      Knight.create(color: 'white', type: 'Knight', current_row_index: 0, current_column_index: 6)
    #end
    
    #def add_bishops_white
      Bishop.create(color: 'white', type: 'Bishop', current_row_index: 0, current_column_index: 2)
      Bishop.create(color: 'white', type: 'Bishop', current_row_index: 0, current_column_index: 5)
    #end
    
    #def add_queen_white
      Queen.create(color: 'white', type: 'Queen', current_row_index: 0, current_column_index: 4)
    #end
   
    #def add_king_white
      King.create(color: 'white', type: 'King', current_row_index: 0, current_column_index: 3)
    #end
 




    

  # create black player pieces
      

    #def add_pawns_black
      (0..7).each do |i|
        Pawn.create(color: 'black', type: 'Pawn', current_row_index: 6,
          current_column_index: i)
      end
    #end

       
    #def add_rooks_black
      Rook.create(color: 'black', type: 'Rook', current_row_index: 7, current_column_index: 0)
      Rook.create(color: 'black', type: 'Rook', current_row_index: 7, current_column_index: 7)
    #end
     
    #def add_knights_black
      Knight.create(color: 'black', type: 'Knight', current_row_index: 7, current_column_index: 1)
      Knight.create(color: 'black', type: 'Knight', current_row_index: 7, current_column_index: 6)
    #end

      

    #def add_bishops_black
      Bishop.create(color: 'black', type: 'Bishop', current_row_index: 7, current_column_index: 2)
      Bishop.create(color: 'black', type: 'Bishop', current_row_index: 7, current_column_index: 5)
    #end

    #def add_queen_black
      Queen.create(color: 'black', type: 'Queen', current_row_index: 7, current_column_index: 4)
    #end


    #def add_king_black
      King.create(color: 'black', type: 'King', current_row_index: 7, current_column_index: 3)
    #end

  end

end

#Game.populate_board!


