class CreatePollerNodes < ActiveRecord::Migration
  def change
    create_table :poller_nodes do |t|
      t.belongs_to :poller
      t.belongs_to :node

      t.timestamps
    end
    add_index :poller_nodes, :poller_id
    add_index :poller_nodes, :node_id
  end
end
