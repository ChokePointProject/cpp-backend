class CreateCityMaps < ActiveRecord::Migration
  def change
    create_table :city_maps do |t|
      t.string :city
      t.string :name
      t.string :region
      t.float :latitude
      t.float :longitude

      t.timestamps
    end
  end
end
