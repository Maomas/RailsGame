class TournamentsController < ApplicationController
  respond_to :json, :js

  # GET /tournaments/index
  # GET /tournaments/index.json
  # GET /tournaments/index.js
  def index
    @tournament = Tournament.new
    @tournaments = Tournament.all
    respond_to do |format|
      format.html 
      format.json { render json: @tournaments }
      format.js
    end
  end

  def show
    @tournament = Tournament.find(params[:id])
  end

  # GET /tournaments/new
  # GET /tournaments/new.json
  # GET /tournaments/new.js
  def new
    respond_to do |format|
      format.html
      format.json { render json: @tournament }
      format.js
    end
  end

  #POST /tournaments
  #POST /tournaments.json
  def create
    @tournament = Tournament.new(tournament_params)

    respond_to do |format|
      if @tournament.save
        format.html { redirect_to @tournament, notice: 'Tournament was successfully created.' }
        format.json { render json: @tournament, status: :created, location: @tournament }
        format.js
      else
        format.html { render :new }
        format.json { render json: @tournament.errors, status: :unprocessable_entity }
        format.js
      end
    end
  end

  def destroy
    @tournament = Tournament.find(params[:id])
    @tournament.matches.each do |match|
      TournamentsMatch.where("tournament_id = ? AND match_id = ?", @tournament.id, match.id)
    end
    @tournament.destroy
    respond_to do |format|
      format.html { redirect_to tournaments_url, notice: 'Tournament was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def edit
    @tournament = Tournament.find(params[:id])
    @games = Game.all
    if(params[:user_id] != nil)
      redirect_to tournaments_url
    end
  end


  def update
    @tournament = Tournament.find(params[:id])
    @tournament.update(tournament_params)
    respond_to do |format|
      if @tournament.update(tournament_params)
        format.html { redirect_to @tournament, notice: 'Tournament was successfully updated.' }
        format.json { render :show, status: :ok, location: @tournament }
      else
        format.html { render :edit }
        format.json { render json: @tournament.errors, status: :unprocessable_entity }
      end
    end
  end

  def ranking
    @tournaments = Tournament.all
    @users = User.order("victories DESC")
    @cpt = 1
  end

  def tournament_params
    params.require(:tournament).permit(:title, :address, :date, :games_list, :users_list)
  end
end
