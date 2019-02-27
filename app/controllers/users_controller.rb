class UsersController < ApplicationController

  def show_tournaments
    @user = User.find(params[:id])
  end

  def show_games
    @user = User.find(params[:id])
    @games = @user.games
  end

  def participate
    @user = User.find(params[:id])
    @tournament = Tournament.find(params[:tournament_id])
    game_ids = params[:game_ids].collect {|id| id.to_i} if params[:game_ids]
    if game_ids
      game_ids.each do |id|
        game = Game.find(id)
        if @user.games.exists?(game.id) == false
          @user.add_game(game)
        end
      end
      @user.add_tournament(@tournament)
      @user.save
      respond_to do |format|
        format.html { redirect_to tournaments_path, notice: 'You\'ve been registered for the tournament. Find opponents and beat them !' }
      end

    end
  end

end
