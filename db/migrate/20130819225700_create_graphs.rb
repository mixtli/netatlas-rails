class CreateGraphs < ActiveRecord::Migration
  def change
    create_table :graphs do |t|
      t.string :title, :null => false
      t.json :options, :default => {}
      t.userstamps
      t.timestamps
    end
  end
end
