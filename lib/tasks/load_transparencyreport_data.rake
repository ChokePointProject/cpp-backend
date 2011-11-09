namespace :load_transparencyreport_data do 
  require 'csv' 
  require 'open-uri' 

  desc "Loading transparencyreport data"
  task :load_content_removal_requests => :environment do
    #csv_text = File.read('https://www.google.com/transparencyreport/governmentrequests/google-content-removal-requests-by-product-and-reason.csv')
    c = CSV.parse(open('https://www.google.com/transparencyreport/governmentrequests/google-content-removal-requests.csv'), :headers => true)
    c.each do |r|
      period_end = Date.strptime(r[0], '%m/%d/%Y')
      e = ContentRemovalRequestPeriod.new(
        :period_start => Date.new(period_end.year, period_end.month-5, 1),
        :period_end => period_end,
        :percentage_complied => r[4]
      )
      #puts r[2], Country.find_by_code(r[2])
      e.country_id = Country.find_by_code(r[2]).id
      e.save!
    end
  end

  desc "Run all transparencyreport data tasks"
  task :all => [:load_content_removal_requests]

end

