class Tournament < ApplicationRecord
  has_many :users_tournament
  has_many :users, through: :users_tournament
  has_many :games_tournament
  has_many :games, through: :games_tournament
  has_many :tournaments_match
  has_many :matches, through: :tournaments_match

  def games_list
    self.games.collect do |game|
      game.title
    end.join(", ")
  end

  def games_list=(games_string)
    games_title = games_string.split(", ").collect{ |s| s}.uniq
    new_or_found_games = games_title.collect {|title| Game.find_or_create_by(title: title)}
    self.games = new_or_found_games
  end

  def users_list
    self.users.collect do |user|
      user.name
    end.join(", ")
  end

  def users_list=(users_string)
    users_name = users_string.collect.split(", ").collect { |s| s }.uniq
    new_or_found_users = users_name.collect {|name| User.find_or_create_by(name: name)}
    self.users = new_or_found_users
  end

  def time_remaining
    self.end_time = self.created_at
    puts self.end_time
    Time.at(self.end_time - Time.now)
  end

  def timer
    time_remaining.strftime("%H:%M:%S")
  end

  def generate_match(tournament_id, player1_id, player2_id) 
    @match = Match.new
    @tournament = Tournament.find(tournament_id)
    @match.player1 = User.find(player1_id).name
    @match.player2 = User.find(player2_id).name
    @match.score = rand(0..3)
    while @match.score == 2
      @match.score = rand(0..3)
    end
    @match.save
    @tournament.matches << @match
    return @match
  end

end
