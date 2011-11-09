class CreateContentRemovalRequestPeriods < ActiveRecord::Migration
  def self.up
    create_table :content_removal_request_periods do |t|
      t.date :period_start
      t.date :period_end
      t.integer :country_id
      t.timestamps
    end
  end

  def self.down
    drop_table :content_removal_request_periods
  end
end
