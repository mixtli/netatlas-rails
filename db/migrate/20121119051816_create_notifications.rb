class CreateNotifications < ActiveRecord::Migration
  def change
    create_table :notifications do |t|
      t.belongs_to :event
      t.belongs_to :contact
      t.belongs_to :event_filter
      t.string :state
      t.userstamps
      t.timestamps
    end
    add_index :notifications, :event_id
    add_index :notifications, :contact_id
    add_index :notifications, :event_filter_id
  end
end
