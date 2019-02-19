class UsersController < ApplicationController

  def show_tournaments
    @user = User.find(params[:id])
    @tournaments = @user.tournaments
  end

  def show_games
    @user = User.find(params[:id])
    @games = @user.games
  end

  def participate
    @user = current_user
    @user.tournaments << Tournament.find(params[:tournament_id])
    @tournament = Tournament.find(params[:tournament_id])
    @tournament.users << User.find(params[:id])
    @games = @tournament.games.all
    game_ids = params[:game_ids].collect {|id| id.to_i} if params[:game_ids]
    if game_ids
      game_ids.each do |id|
        game = Game.find(id)
        @user.games << game
      end
    end
  end

end
