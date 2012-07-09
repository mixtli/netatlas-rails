class CreateDataStreams < ActiveRecord::Migration
  def change
    create_table :data_streams do |t|
      t.belongs_to :data_source
      t.belongs_to :poller
      t.userstamps(true)
      t.timestamps
    end
    add_index :data_streams, :data_source_id
    add_index :data_streams, :poller_id
  end
end
