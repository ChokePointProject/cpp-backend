class CreateCountryMeasurements < ActiveRecord::Migration
  def change
    create_table :country_measurements do |t|
      t.integer :country
      t.date :month
      t.float :DownloadThroughputSplitByClientAndByServer
      t.float :UploadThroughputSplitByClientAndByServer
      t.float :RTTSplitByClientAndByServer
      t.float :NetLimitedSplitByClientAndByServer
      t.float :ClientLimitedSplitByClientAndByServer
      t.float :WinScaleRcvdSplitByClientAndByServer
      t.float :NumberOfClientsSplitByClientAndByServer

      t.timestamps
    end
  end
end
