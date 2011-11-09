# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

# Seed Continents and Countries with xml data
require 'open-uri'

h = Hash.from_xml(open('https://raw.github.com/ChokePointProject/cpp-web/master/tmp/countryInfo.xml'))['geonames']['country']

h.each do |c|
  n = Country.new(
    :code         => c['countryCode'],
    :name         => c['countryName'],
    :isoNumeric   => c['isoNumeric'],
    :isoAlpha3    => c['isoAlpha3'],
    :fipsCode     => c['fipsCode'],
    :capital      => c['capital'],
    :areaInSqKm   => c['areaInSqKm'],
    :population   => c['population'],
    :currencyCode => c['currencyCode'],
    :languages    => c['languages'],
    :geonameId    => c['geonameId'],
    :bBoxWest     => c['bBoxWest'],
    :bBoxNorth    => c['bBoxNorth'],
    :bBoxEast     => c['bBoxEast'],
    :bBoxSouth    => c['bBoxSouth']
  )
  n.continent = Continent.find_or_create_by_code_and_name(c['continent'], c['continentName'])
  n.save!
end

