class CreateCountries < ActiveRecord::Migration
  def self.up
    create_table :countries do |t|
      t.integer :continent_id
      t.string :code
      t.string :name
      t.integer :isoNumeric
      t.string :isoAlpha3
      t.string :fipsCode
      t.string :capital
      t.float :areaInSqKm
      t.integer :population
      t.string :currencyCode
      t.string :languages
      t.integer :geonameId
      t.float :bBoxWest
      t.float :bBoxNorth
      t.float :bBoxEast
      t.float :bBoxSouth
      t.timestamps
    end
  end

  def self.down
    drop_table :countries
  end
end
