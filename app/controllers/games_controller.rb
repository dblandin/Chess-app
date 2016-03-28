class GamesController < ApplicationController
  def new
    @game = Game.new
  end

  def index
    # Queries 10 games
    @games = Game.open_seats
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
    @game.update_attributes(game_params)
  end

  private

  def game_params
    params.require(:game).permit(:name)
  end
end
