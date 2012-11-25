class CreateEventFilters < ActiveRecord::Migration
  def change
    create_table :event_filters do |t|
      t.string :label
      t.integer :node_ids, :array => true
      t.string :types, :array => true
      t.string :states, :array => true
      t.string :severities, :array => true
      t.integer :group_ids, :array => true
      t.boolean :public
      t.timestamps
      t.userstamps
    end
  end
end
