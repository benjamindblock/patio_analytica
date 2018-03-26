class CreateWeatherData < ActiveRecord::Migration[5.1]
  def change
    create_table :weather_data do |t|
      t.decimal :temperature
      t.string :conditions
      t.string :message

      t.timestamps
    end
  end
end
