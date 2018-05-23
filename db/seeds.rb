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

Mix.create!(name: "Simic's Mix",
            artist: 'Simic',
            description: 'New Mix',
            s3_url: "https://s3-us-west-2.amazonaws.com/patio-mixes/Simic's+2018(08)+Mix.mp3")
