class CreateStores < ActiveRecord::Migration[7.1]
  def change
    create_table :stores do |t|
      t.string :name
      t.text :description
      t.string :city
      t.string :address
      t.string :country
      t.string :zipcode
      t.float :latitude
      t.string :longitude

      t.timestamps
    end
  end
end
