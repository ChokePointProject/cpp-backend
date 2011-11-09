# encoding: UTF-8
# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20111109012514) do

  create_table "city_maps", :force => true do |t|
    t.string   "city"
    t.string   "name"
    t.string   "region"
    t.float    "latitude"
    t.float    "longitude"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "city_measurements", :force => true do |t|
    t.integer  "city_map_id"
    t.string   "city"
    t.date     "month"
    t.float    "DownloadThroughputSplitByClientAndByServer"
    t.float    "UploadThroughputSplitByClientAndByServer"
    t.float    "RTTSplitByClientAndByServer"
    t.float    "NetLimitedSplitByClientAndByServer"
    t.float    "ClientLimitedSplitByClientAndByServer"
    t.float    "WinScaleRcvdSplitByClientAndByServer"
    t.float    "NumberOfClientsSplitByClientAndByServer"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "content_removal_request_periods", :force => true do |t|
    t.date     "period_start"
    t.date     "period_end"
    t.integer  "country_id"
    t.float    "percentage_complied"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "content_removal_requests", :force => true do |t|
    t.integer  "content_removal_request_period_id"
    t.integer  "product_id"
    t.integer  "reason_id"
    t.integer  "courtOrders"
    t.integer  "executive"
    t.integer  "items"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "continents", :force => true do |t|
    t.string   "code"
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "countries", :force => true do |t|
    t.integer  "continent_id"
    t.string   "code"
    t.string   "name"
    t.integer  "isoNumeric"
    t.string   "isoAlpha3"
    t.string   "fipsCode"
    t.string   "capital"
    t.float    "areaInSqKm"
    t.integer  "population"
    t.string   "currencyCode"
    t.string   "languages"
    t.integer  "geonameId"
    t.float    "bBoxWest"
    t.float    "bBoxNorth"
    t.float    "bBoxEast"
    t.float    "bBoxSouth"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "country_maps", :primary_key => "country", :force => true do |t|
    t.string   "name"
    t.float    "latitude"
    t.float    "longitude"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "country_measurements", :force => true do |t|
    t.integer  "country"
    t.date     "month"
    t.float    "DownloadThroughputSplitByClientAndByServer"
    t.float    "UploadThroughputSplitByClientAndByServer"
    t.float    "RTTSplitByClientAndByServer"
    t.float    "NetLimitedSplitByClientAndByServer"
    t.float    "ClientLimitedSplitByClientAndByServer"
    t.float    "WinScaleRcvdSplitByClientAndByServer"
    t.float    "NumberOfClientsSplitByClientAndByServer"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "products", :force => true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "reasons", :force => true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "world_measurements", :force => true do |t|
    t.date     "month"
    t.float    "DownloadThroughputSplitByClientAndByServer"
    t.float    "UploadThroughputSplitByClientAndByServer"
    t.float    "RTTSplitByClientAndByServer"
    t.float    "NetLimitedSplitByClientAndByServer"
    t.float    "ClientLimitedSplitByClientAndByServer"
    t.float    "WinScaleRcvdSplitByClientAndByServer"
    t.float    "NumberOfClientsSplitByClientAndByServer"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
