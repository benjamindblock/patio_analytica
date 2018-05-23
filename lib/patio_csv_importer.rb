require 'CSV'

class PatioCsvImporter
  def initialize filepath
    @filepath = filepath
  end

  def import_csv
    CSV.foreach(@filepath, headers: true) do |row|
      create_hash = {}

      # basic info
      create_hash['name'] = row['Patio Name'].strip.upcase
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
      create_hash['on_street'] = get_boolean_field_val(row['Street Patio'])

      Patio.create!(create_hash)
    end
  end

  private

  def get_boolean_field_val value
    value.strip.downcase.eql?('yes')
  end

end
