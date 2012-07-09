class CreateGroups < ActiveRecord::Migration
  def change
    create_table :groups do |t|
      t.string :name
      t.references :parent
      t.userstamps
      t.timestamps
    end
    add_index :groups, :parent_id
    add_index :groups, :name
  end
end
