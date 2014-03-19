class CreateRestaurants < ActiveRecord::Migration
  def change
    create_table :restaurants do |t|
      t.string :locu_id
      t.string :name
      t.text :street_address
      t.string :locality
      t.string :region
      t.string :postal_code
      t.string :country
      t.string :phone
      t.decimal :long
      t.decimal :lat
      t.text :websiteUrl

      t.timestamps
    end
  end
end
