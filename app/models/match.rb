class Match < ApplicationRecord
  has_many :users_match, dependent: :delete_all
  has_many :users, through: :users_match
  has_many :tournaments_match, dependent: :delete_all
  has_many :tournaments, through: :tournaments_match
end
