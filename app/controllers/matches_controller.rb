class MatchesController < ApplicationController

  def index
    @tournament = Tournament.find(params[:id])
    @games = Game.where(:user_id => current_user.id, :tournament_id => @tournament.id)
  end

end
