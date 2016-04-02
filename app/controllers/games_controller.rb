class GamesController < ApplicationController
  def new
    @game = Game.new
  end

  def index
    # Queries 10 games
    @games = Game.list_available_games
  end

  def create
    # Note that the creator of the game automatically
    # becomes the black_player. Due to some issues in
    # querying, for games index, the model only checks
    # for games where the white_player_id is nil.
    @game = Game.create(game_params)
    @game.update_attribute(game_params)
    redirect_to root_path
  end

  def show
    @game = Game.find(params[:id])
    @pieces = Piece.where(game_id: @game.id)
  end

  def update
    @game = Game.find(params[:id])
    @game.update_attributes(game_params)
  end

  private

  def game_params
    params.require(:game).permit(:name)
  end
end
