class Tournament < ApplicationRecord
  has_many :users_tournament, dependent: :delete_all
  has_many :users, through: :users_tournament
  has_many :games_tournament, dependent: :delete_all
  has_many :games, through: :games_tournament
  has_many :tournaments_match, dependent: :delete_all
  has_many :matches, through: :tournaments_match

  geocoded_by :address #latitude: :latitude, longitude: :longitude
  after_validation :geocode, if: ->(obj){ obj.address.present? and obj.address_changed? }

  reverse_geocoded_by :latitude, :longitude



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


    def measure_distance(user)
      @user = User.find(user.id)
      if @user
        return "The distance between your address and the tournament is #{@user.distance_from(self.to_coordinates)} km."
      end

    end

  def generate_match(player1, player2, game)
      if player1 != player2
      @match = Match.new
      @match.player1 = User.where("name = ?",player1).take.name
      @match.player2 = User.where("name = ?",player2).take.name
      @match.game = game.title
      @match.score = rand(0..3)
      while @match.score == 2
        @match.score = rand(0..3)
      end
      @match.save
      self.matches << @match
    end
      return @match
  end

end
