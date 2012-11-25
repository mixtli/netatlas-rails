class CreateNodes < ActiveRecord::Migration
  def change
    create_table :nodes do |t|
      t.string :label, :null => false, :limit => 32
      t.text :description
      t.string :type, :limit => 32
      t.string :state, :limit => 16, :default => "unknown"
      t.belongs_to :device
      t.integer :snmp_index, :limit => 64
      t.hstore :snmp_attributes
      t.datetime :last_scan
      t.userstamps(true)
      t.timestamps
    end
    add_index :nodes, :device_id
    add_index :nodes, :label
    add_index :nodes, :type
    add_index :nodes, :state
    add_index :nodes, :snmp_index
  end
end
