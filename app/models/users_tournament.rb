class UsersTournament < ApplicationRecord
  belongs_to :user
  belongs_to :tournament
end
