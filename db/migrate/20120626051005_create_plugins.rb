class CreatePlugins < ActiveRecord::Migration
  def change
    create_table :plugins do |t|
      t.string :name
      t.string :class_name

      t.timestamps
      t.userstamps
    end
    add_index :plugins, :name
    add_index :plugins, :class_name
  end
end
