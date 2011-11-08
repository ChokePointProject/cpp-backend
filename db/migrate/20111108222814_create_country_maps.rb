class CreateCountryMaps < ActiveRecord::Migration
  def change
    create_table :country_maps, :primary_key => 'country' do |t|
      t.string :name
      t.float :latitude
      t.float :longitude

      t.timestamps
    end
  end
end
