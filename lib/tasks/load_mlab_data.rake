namespace :load_mlab_data do 
  require 'csv' 

  desc "Loading world_measurements data"
  task :load_world_measurements_data => :environment do
    csv_text = File.read('mlab_data/world_measurements.txt')
    csv = CSV.parse(csv_text, :headers => true)
    csv.each do |row|
      row = row.to_hash.with_indifferent_access
      WorldMeasurement.create!(row.to_hash.symbolize_keys)
    end
  end

  desc "Loading country_map data"
  task :load_country_map => :environment do
    csv_text = File.read('mlab_data/country_map.txt')
    csv = CSV.parse(csv_text, :headers => true)
    csv.each do |row|
      row = row.to_hash.with_indifferent_access
      countrymap = CountryMap.new(row.to_hash.symbolize_keys)
      countrymap.country = row.to_hash.symbolize_keys[:country] 
      countrymap.save!
    end
  end

  desc "Loading country_measurements data"
  task :load_country_measurements => :environment do
    csv_text = File.read('mlab_data/country_measurements.txt')
    csv = CSV.parse(csv_text, :headers => true)
    csv.each do |row|
      row = row.to_hash.with_indifferent_access
      CountryMeasurement.create!(row.to_hash.symbolize_keys)
    end
  end

  desc "Run all mlab data tasks"
  task :all => [:load_world_measurements_data, :load_country_map, :load_country_measurements]

end
