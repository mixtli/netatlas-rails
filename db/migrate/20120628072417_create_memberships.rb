class CreateMemberships < ActiveRecord::Migration
  def change
    create_table :memberships do |t|
      t.belongs_to :group
      t.belongs_to :node
      t.userstamps
      t.timestamps
    end
    add_index :memberships, :group_id
    add_index :memberships, :node_id
    add_index :memberships, :creator_id
    add_index :memberships, :updater_id
  end
end
