class Patio < ApplicationRecord
  enum region: [:south, :central, :downtown, :north]

  scope :is_covered, -> { where(is_covered: true) }
  scope :on_rooftop, -> { where(on_rooftop: true) }
  scope :is_bougie, -> { where(is_bougie: true) }
  scope :has_view, -> { where(has_view: true) }
  scope :more_bar_than_restaurant, -> { where(more_bar_than_restaurant: true) }
end
