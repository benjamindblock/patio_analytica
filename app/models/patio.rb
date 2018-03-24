class Patio < ApplicationRecord
  enum seating_location: [:standard, :street, :rooftop]
end
