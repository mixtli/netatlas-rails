class CreateDataPoints < ActiveRecord::Migration
  def change
    create_table :data_points do |t|
      t.references :data_stream
      t.timestamp :timestamp
      t.datetime :created_at
      t.float :value

      t.timestamps
    end
    add_index :data_points, :data_stream_id
  end
end
