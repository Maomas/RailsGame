class MatchesController < ApplicationController

  def index
    @tournament = Tournament.find(params[:tournament_id])
    @games = @tournament.games.all
  end

end
