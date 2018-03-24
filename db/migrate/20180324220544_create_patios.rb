class CreatePatios < ActiveRecord::Migration[5.1]
  def change
    create_table :patios do |t|
      t.string :name
      t.string :google_place_id
      t.integer :seating_location
      t.boolean :is_covered
      t.boolean :has_view
      t.boolean :is_recommended

      t.timestamps
    end
  end
end
