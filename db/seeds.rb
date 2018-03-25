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
              is_recommended: true,
              neighborhood: 'Capitol Hill',
              region: Patio.regions[:central])

Patio.create!(name: "Linda's Tavern",
              google_place_id: 'ChIJq_ZsMcxqkFQR03TQy4-KrBE',
              seating_location: Patio.seating_locations[:standard],
              is_covered: false,
              has_view: false,
              is_recommended: false,
              neighborhood: 'Capitol Hill',
              region: Patio.regions[:central])

Patio.create!(name: "Brimmer & Heeltap",
              google_place_id: 'ChIJw3NuNbUVkFQRakTXJ8_lT5E',
              seating_location: Patio.seating_locations[:standard],
              is_covered: false,
              has_view: false,
              is_recommended: true,
              neighborhood: 'Ballard',
              region: Patio.regions[:north])

Patio.create!(name: "Zig Zag Cafe",
              google_place_id: 'ChIJUQY5irJqkFQRNyEM-1Nq3oQ',
              seating_location: Patio.seating_locations[:standard],
              is_covered: false,
              has_view: false,
              is_recommended: true,
              neighborhood: 'Pike Place',
              region: Patio.regions[:downtown])

Patio.create!(name: "The Blu Grouse",
              google_place_id: 'ChIJkXPcf79BkFQRXPs2AKy1JEc',
              seating_location: Patio.seating_locations[:standard],
              is_covered: false,
              has_view: false,
              is_recommended: false,
              neighborhood: 'Georgetown',
              region: Patio.regions[:south])
