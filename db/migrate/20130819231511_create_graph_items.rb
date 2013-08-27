class CreateGraphItems < ActiveRecord::Migration
  def change
    create_table :graph_items do |t|
      t.belongs_to :graph, index: true
      t.belongs_to :data_source, index: true
      t.json :options, :default => {}
      t.userstamps
      t.timestamps
    end
  end
end
