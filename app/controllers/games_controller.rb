class GamesController < ApplicationController

  def new
    @game = Game.new
  end

  def index
    @games = Game.all
  end

  def create
    @game = Game.create(game_params)
    @game.update_attribute(game_params)
    redirect_to root_path
  end

  def show
    @game = Game.find(params[:id])
  end

  def update
    @game = Game.find(params[:id])
    if request.xhr?
      # e.g. pawnBlack or kingWhite, etc
      selected_piece = request['selected_piece']

      # Square that the selected_piece initially
      # resides in. Format is row4col4, or row1col6, etc
      initial_square = request['initial_square']

      # Square that the user wants the selected piece
      # to move to. Format is row4col4, or row1col6, etc
      final_square = request['final_square']

      # Create backend logic in models and call them here
      # with the incoming data as arguments

      # data to be returned. Will contain the return of 
      # the model logic.
      # Piece_captured is so javascript can update the
      # captured pieces board.
      # Message would go in the game status board, so
      # stuff like 'your turn' or 'invalid move',
      # 'checkmate', etc.
      valid_move = true
      piece_captured = 'pawnWhite'
      message = nil

      # feel free to add new data entries to the output
      respond_to do |format|
        format.json do
          render json: {
            validMove: valid_move,
            pieceCaptured: piece_captured,
            message: nil
          }.to_json
        end
      end

    else
      # This code runs if the request is not ajax
      @game.update_attributes(game_params)
    end
  end

  private

  def game_params
    params.require(:game).permit(:name)
  end
end
