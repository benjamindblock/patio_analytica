# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

require 'patio_csv_importer'

filepath = Rails.root.join('lib', 'import_files', 'import.csv')
importer = PatioCsvImporter.new(filepath)
importer.import_csv

Mix.create!(name: "SPCM001",
            artist: "Alex Carrabba",
            description: "10pm, Seattle, late July: the last rays of sunset are fading behind Queen Anne. Take a stroll along the Eastlake promenade and odds are that you'll find Alex Carrabba on the decks somewhere, providing expertly selected low-to-mid-tempo grooves to a moonlit dance floor. Join in.",
            duration: '1:17:09',
            s3_url: "https://s3-us-west-2.amazonaws.com/patio-mixes/SPCM001.mp3")

Mix.create!(name: "SPCM002",
            artist: 'GOOP',
            description: "It's summer. It's hot. It's muggy. Sweat clings to your tank top. A butterfly temporary tattoo is peeling off your arm. Your friend GOOP pulls up in the '94 Dodge Dakota. You're feeling down, but not out. You're ready to explore... ",
            duration: '1:28:35',
            s3_url: "https://s3-us-west-2.amazonaws.com/patio-mixes/SPCM002.mp3")
