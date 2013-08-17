class CreateSubscriptions < ActiveRecord::Migration
  def change
    create_table :subscriptions do |t|
      t.belongs_to :group
      t.belongs_to :poller
      t.belongs_to :node
      t.string :state
      t.string :severity
      t.userstamps
      t.timestamps
    end
    add_index :subscriptions, :group_id
    add_index :subscriptions, :poller_id
    add_index :subscriptions, :node_id
    add_index :subscriptions, :state
    add_index :subscriptions, :severity
    add_index :subscriptions, :creator_id
    add_index :subscriptions, :updater_id
  end
end
