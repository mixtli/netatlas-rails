class CreateOutages < ActiveRecord::Migration
  def change
    create_table :outages do |t|
      t.belongs_to :node, index: true
      t.timestamp :start_time
      t.timestamp :end_time
      t.text :description
      t.userstamps
      t.timestamps
    end
  end
end
