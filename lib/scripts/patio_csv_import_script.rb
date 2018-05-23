require 'patio_csv_importer'
require 'CSV'

filepath = Rails.root.join('tmp', 'import.csv')
importer = PatioCsvImporter.new(filepath)
importer.import_csv
