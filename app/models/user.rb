class User < ApplicationRecord
  rolify
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :users_game, dependent: :delete_all
  has_many :games, through: :users_game
  has_many :users_tournament, dependent: :delete_all
  has_many :tournaments, through: :users_tournament
  has_many :users_match, dependent: :delete_all
  has_many :matches, through: :users_match

  geocoded_by :full_address
  after_validation :geocode

  def games_list
    self.games.collect do |game|
      game.title
    end.join(", ")
  end

  def games_list=(games_string)
    games_name = games_string.split(", ").collect{|s| s}.uniq
    new_or_found_games = games_name.collect { | title | Game.find_or_create_by(title: title) }
    self.games = new_or_found_games
  end

  def tournaments_list
    self.tournaments.collect do |tournament|
      tournament.title
    end.join(", ")
  end

  def tournaments_list=(tournaments_string)
    tournaments_title = tournaments_string.split(",").collect{|s| s.strip.downcase}.uniq
    new_or_found_tournaments = tournaments_title.collect { |title| Tournament.find_or_create_by(title: title) }
    self.tournaments = new_or_found_tournaments
  end

  def full_address
    [self.country,self.city, self.street].compact.join(',')
  end

  def add_tournament(tournament)
    self.tournaments << tournament
  end

  def add_game(game)
    self.games << game
  end

end
