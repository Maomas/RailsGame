class Game < ApplicationRecord
  has_attached_file :image, styles: {medium: "300x300>", thumb: "100x100>" }
  validates_attachment_content_type :image, :content_type => ["image/jpg", "image/jpeg", "image/png"]
  has_many :games_tournament, dependent: :delete_all
  has_many :tournaments, through: :games_tournament
  has_many :users_game, dependent: :delete_all
  has_many :users, through: :users_game

  def users_list
    self.users.collect do |user|
      user.name
    end.join(", ")
  end

  def users_list=(users_string)
    users_name = users_string.split(", ").collect{|s| s}.uniq
    new_or_found_users = users_name.collect { | name | User.find_or_create_by(name: name) }
    self.users = new_or_found_users
  end

  def tournaments_list
    self.tournaments.collect do |tournament|
      tournament.title
    end.join(", ")
  end

  def tournaments_list=(tournaments_string)
    tournaments_title = tournaments_string.split(",").collect{|s| s.strip.downcase}.uniq
    new_or_found_tournaments = tournaments_title.collect { |title| Tag.find_or_create_by(title: title) }
    self.tournaments = new_or_found_tournaments
  end


end
