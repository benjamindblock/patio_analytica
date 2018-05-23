class CreateMixes < ActiveRecord::Migration[5.1]
  def change
    create_table :mixes do |t|
      t.string :name
      t.string :artist
      t.string :s3_url
      t.text :description
    end
  end
end
