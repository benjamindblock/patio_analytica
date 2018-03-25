require 'CSV'

filepath = Rails.root.join('tmp', 'import.csv')

def get_boolean_field_val value
  value.strip.downcase.eql?('yes')
end

CSV.foreach(filepath, headers: true) do |row|
  create_hash = {}

  # basic info
  create_hash['name'] = row['Patio Name'].strip
  create_hash['google_place_id'] = row['Google ID'].strip
  create_hash['special_notes'] = row['Special Classification']&.strip

  # location data
  region = row['Region'].strip.downcase
  create_hash['region'] = Patio.regions[region]
  create_hash['neighborhood'] = row['Neighborhood'].strip

  # extra info
  create_hash['is_recommended'] = get_boolean_field_val(row['Recommended'])
  create_hash['is_bougie'] = get_boolean_field_val(row['Bougie'])
  create_hash['more_bar_than_restaurant'] = get_boolean_field_val(row['More Bar Than Restaurant'])
  create_hash['on_rooftop'] = get_boolean_field_val(row['Rooftop Patio'])
  create_hash['is_small'] = get_boolean_field_val(row['Small Patio'])
  create_hash['is_covered'] = get_boolean_field_val(row['Covered Patio'])
  create_hash['has_view'] = get_boolean_field_val(row['View'])

  Patio.create!(create_hash)
end