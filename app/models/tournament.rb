class Tournament < ApplicationRecord
  has_many :users_tournament
  has_many :users, through: :users_tournament
  has_many :games_tournament
  has_many :games, through: :games_tournament
  has_many :matches

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

end
