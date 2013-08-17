class CreateEvents < ActiveRecord::Migration
  def change
    create_table :events do |t|
      t.belongs_to :poller
      t.belongs_to :node
      t.belongs_to :data_source
      t.string :type
      t.string :state
      t.integer :repeats, :default => 0
      t.string :severity
      t.text :description
      t.text :additional
      t.text :notes
      t.hstore :arguments
      t.references :acknowledged_by
      t.references :resolved_by
      t.datetime :acknowledged_at
      t.datetime :resolved_at
      t.timestamps
      t.userstamps
    end
    add_index :events, :poller_id
    add_index :events, :node_id
    add_index :events, :data_source_id
    add_index :events, :acknowledged_by_id
    add_index :events, :resolved_by_id
    add_index :events, :state
    add_index :events, :severity
  end
end
