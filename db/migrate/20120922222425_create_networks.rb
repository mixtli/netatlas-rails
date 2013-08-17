class CreateNetworks < ActiveRecord::Migration
  def change
    create_table :networks do |t|
      t.cidr :address
      t.userstamps
      t.timestamps
    end
  end
end
