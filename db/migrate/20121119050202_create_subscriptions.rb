class CreateSubscriptions < ActiveRecord::Migration
  def change
    create_table :subscriptions do |t|
      t.belongs_to :user
      t.belongs_to :event_filter
      t.userstamps
      t.timestamps
    end
    add_index :subscriptions, :user_id
    add_index :subscriptions, :event_filter_id
  end
end
