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

Mix.create!(name: "SPCM001: Patio After Dark Extraordinaire Mix",
            artist: 'Simic',
            description: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Proin in sagittis leo. Nulla ac consectetur lectus. Nunc fermentum arcu nec arcu sodales consequat. Proin efficitur orci quis lorem efficitur, sit amet maximus leo elementum. Integer et varius nunc. Sed blandit turpis ac diam varius dictum. Fusce id ullamcorper urna. Fusce lobortis tempor mauris, nec sollicitudin dolor cursus at. Aenean fermentum magna nec ex eleifend, in vestibulum eros aliquet. Praesent quis tortor erat. Sed volutpat nulla quis tellus commodo, mattis varius lectus fringilla. Mauris egestas enim eu lacus dictum aliquet. Nunc aliquam in velit at accumsan.',
            duration: '1:10:24',
            s3_url: "https://s3-us-west-2.amazonaws.com/patio-mixes/Simic's+2018(08)+Mix.mp3")

Mix.create!(name: "SPCM002: Margaritaville's No-More-Margs Mix",
            artist: 'Jimmy Buffet',
            description: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Proin in sagittis leo. Nulla ac consectetur lectus. Nunc fermentum arcu nec arcu sodales consequat. Proin efficitur orci quis lorem efficitur, sit amet maximus leo elementum.',
            duration: '00:50:13',
            s3_url: "https://s3-us-west-2.amazonaws.com/patio-mixes/Simic's+2018(08)+Mix.mp3")
