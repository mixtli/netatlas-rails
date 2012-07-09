class CreateDataTemplates < ActiveRecord::Migration
  def change
    create_table :data_templates do |t|
      t.string :name, :null => false
      t.belongs_to :plugin, :null => false
      t.integer :interval, :default => 300, :null => false
      t.float :warning_threshold
      t.float :critical_threshold
      t.string :operator, :default => '>'
      t.text :description
      t.text :arguments
      t.userstamps
      t.timestamps
    end
    add_index :data_templates, :plugin_id
    add_index :data_templates, :name
  end
end
