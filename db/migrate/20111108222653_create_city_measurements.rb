class CreateCityMeasurements < ActiveRecord::Migration
  def change
    create_table :city_measurements do |t|
      t.string :city
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
