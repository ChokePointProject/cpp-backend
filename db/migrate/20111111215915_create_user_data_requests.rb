class CreateUserDataRequests < ActiveRecord::Migration
  def self.up
    create_table :user_data_requests do |t|
      t.date :period_start
      t.date :period_end
      t.integer :country_id
      t.integer :requests
      t.float :percentage_complied
      t.integer :accounts
      t.timestamps
    end
  end

  def self.down
    drop_table :user_data_requests
  end
end
