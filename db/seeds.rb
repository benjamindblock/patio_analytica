# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Patio.create!(name: 'Bar Vacilando',
              google_place_id: 'ChIJhSXzfCsVkFQRz72dnQ993A0',
              seating_location: Patio.seating_locations[:standard],
              is_covered: true,
              has_view: false,
              is_recommended: true)

Patio.create!(name: "Linda's Tavern",
              google_place_id: 'ChIJq_ZsMcxqkFQR03TQy4-KrBE',
              seating_location: Patio.seating_locations[:standard],
              is_covered: false,
              has_view: false,
              is_recommended: false)
