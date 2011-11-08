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

  desc "Run all mlab data tasks"
  task :all => [:load_world_measurements_data]

end
