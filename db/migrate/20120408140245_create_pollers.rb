class CreatePollers < ActiveRecord::Migration
  def change
    create_table :pollers do |t|
      t.string :hostname
      t.integer :port, :defaults => 12345
      t.string :state, :limit => 16, :default => :unknown
      t.string :queue_username, :null => false, :limit => 32
      t.string :queue_password, :null => false, :limit => 32
      t.userstamps(true)
      t.timestamps
    end
    add_index :pollers, :hostname
  end
end
