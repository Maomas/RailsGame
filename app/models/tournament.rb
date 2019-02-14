class Tournament < ApplicationRecord
  belongs_to :user, optional: true
end
