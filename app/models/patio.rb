class Patio < ApplicationRecord
  enum region: [:south, :central, :downtown, :north]
end
