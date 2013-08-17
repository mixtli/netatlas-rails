class CreateInterfaces < ActiveRecord::Migration
  def change
    create_table :interfaces, :id => false, :options => "INHERITS(nodes)" do |t|
      t.inet :ip_address
      t.string :hostname
      t.integer :if_speed
      t.integer :if_type
      t.string :if_name
      t.string :if_alias
      t.string :if_descr
      t.boolean :if_promiscuous
      t.integer :if_high_speed
      t.string :if_admin_status
      t.macaddr :physical_address
      t.integer :mtu
      t.string :duplex

      t.timestamps
    end
  end
end
