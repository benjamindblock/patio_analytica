class Patio < ApplicationRecord
  enum seating_location: [:standard, :street, :rooftop]
  enum region: [:south, :central, :downtown, :north]
end
