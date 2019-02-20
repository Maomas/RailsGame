class TournamentsMatch < ApplicationRecord
  belongs_to :tournament
  belongs_to :match
end
