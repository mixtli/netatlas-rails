class CreateCommands < ActiveRecord::Migration
  def change
    create_table :commands do |t|
      t.string :name, :null => false
      t.belongs_to :poller, :null => false
      t.string :state, :null => false
      t.hstore :arguments
      t.text :message
      t.timestamps
      t.userstamps
    end
    add_index :commands, :poller_id
  end
end
