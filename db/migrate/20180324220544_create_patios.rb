class CreatePatios < ActiveRecord::Migration[5.1]
  def change
    create_table :patios do |t|
      # basic info
      t.string :name
      t.string :google_place_id
      t.text :special_notes

      # location info
      t.integer :region
      t.string :neighborhood

      # extra info
      t.boolean :is_recommended
      t.boolean :is_bougie
      t.boolean :more_bar_than_restaurant
      t.boolean :on_rooftop
      t.boolean :is_small
      t.boolean :is_covered
      t.boolean :has_view
      t.boolean :on_street

      t.timestamps
    end
  end
end
