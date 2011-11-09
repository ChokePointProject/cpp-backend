namespace :load_transparencyreport_data do 
  require 'csv' 
  require 'open-uri' 

  desc "Loading transparencyreport data: content removal request"
  task :load_content_removal_requests => :environment do
    # Read in XML data
    c = CSV.parse(open('https://www.google.com/transparencyreport/governmentrequests/google-content-removal-requests.csv'), :headers => true)
    c.each do |r|
      period_end = Date.strptime(r[0], '%m/%d/%Y')
      e = ContentRemovalRequestPeriod.new(
        :period_start => Date.new(period_end.year, period_end.month-5, 1),
        :period_end => period_end,
        :percentage_complied => r[4]
      )
      e.country_id = Country.find_by_code(r[2]).id
      e.save!
    end
  end

  desc "Loading transparencyreport data: content removal request by product"
  task :load_content_removal_requests_by_product => :environment do
    # Create reason 'undefined' (since this dataset doesn't contain reasons)
    undefined = Reason.find_or_create_by_name('Undefined')
    # Read in XML data
    c = CSV.parse(open('https://www.google.com/transparencyreport/governmentrequests/google-content-removal-requests-by-product.csv'), :headers => true)
    c.each do |r|
      # Only add entries prior from 2010-12-31
      if Date.strptime(r[0], '%m/%d/%Y') < Date.new(2010,12,31)
        e = ContentRemovalRequest.new(
          :court_orders => r[4],
          :executive => r[5],
          :items => r[6]
        )
        e.content_removal_request_period = ContentRemovalRequestPeriod.joins(:country).where('countries.code' => r[2]).find_by_period_end(Date.strptime(r[0], '%m/%d/%Y'))
        e.product = Product.find_or_create_by_name(r[3])
        e.reason = undefined
        e.save!
      end
    end
  end

  desc "Loading transparencyreport data: content removal request by product and reason"
  task :load_content_removal_requests_by_product_and_reason => :environment do
    # Read in XML data
    c = CSV.parse(open('https://www.google.com/transparencyreport/governmentrequests/google-content-removal-requests-by-product-and-reason.csv'), :headers => true)
    c.each do |r|
      period = ContentRemovalRequestPeriod.joins(:country).where('countries.code' => r[2]).find_by_period_end(Date.strptime(r[0], '%m/%d/%Y'))
      # Delete superseded data
      #puts period.content_removal_requests.joins(:product).where('products.name' => r[3]).count
      #period.content_removal_requests.joins(:product).where('products.name' => r[3]).delete_all
      # Create new data
      e = ContentRemovalRequest.new(
        :court_orders => r[5],
        :executive => r[6],
        :items => r[7]
      )
      e.content_removal_request_period = period
      e.product = Product.find_or_create_by_name(r[3])
      e.reason = Reason.find_or_create_by_name(r[4])
      e.save!
    end
  end

  desc "Run all transparencyreport data tasks"
  task :all => [
    :load_content_removal_requests,
    :load_content_removal_requests_by_product,
    :load_content_removal_requests_by_product_and_reason
  ]

end

