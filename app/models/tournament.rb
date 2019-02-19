class Tournament < ApplicationRecord
  has_many :users
  has_many :games
  has_many :matches

  def game_list
    self.games.collect do |game|
      game.title
    end.join(", ")
  end

def game_list=(games_string)
  game_titles = games_string.split(", ").collect{ |s| s}.uniq
  new_or_found_games = game_titles.collect {|title| Game.find_or_create_by(title: title)}
  self.games = new_or_found_games
end
end
