class CreateDataSources < ActiveRecord::Migration
  def change
    create_table :data_sources do |t|
      t.belongs_to :node, :null => false
      t.belongs_to :plugin, :null => false
      t.belongs_to :data_template
      t.string :state, :null => false, :limit => 16
      t.datetime :last_polled_at
      t.integer :interval, :default => 300, :null => false
      t.text :description
      t.text :arguments
      t.text :varbinds
      t.float :warning_threshold
      t.float :critical_threshold
      t.string :operator, :default => '>', :limit => 8
      t.userstamps(true)
      t.timestamps
    end
    add_index :data_sources, :node_id
    add_index :data_sources, :plugin_id
    add_index :data_sources, :data_template_id
  end
end
