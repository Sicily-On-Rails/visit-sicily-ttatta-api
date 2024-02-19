class CreateLocations < ActiveRecord::Migration[7.1]
  def change
    create_table :locations do |t|
      t.string :name
      t.text :description
      t.string :city
      t.string :address
      t.string :country
      t.string :zipcode
      t.float :latitude
      t.string :longitude
      t.references :event, null: true, foreign_key: true

      t.timestamps
    end
  end
end
