class CreateContentRemovalRequests < ActiveRecord::Migration
  def self.up
    create_table :content_removal_requests do |t|
      t.integer :content_removal_request_period_id
      t.integer :product_id
      t.integer :reason_id
      t.integer :courtOrders
      t.integer :executive
      t.integer :items
      t.timestamps
    end
  end

  def self.down
    drop_table :content_removal_requests
  end
end
