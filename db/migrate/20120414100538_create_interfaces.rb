class CreateInterfaces < ActiveRecord::Migration
  def change
    create_table :interfaces, :id => false, :options => "INHERITS(nodes)" do |t|
      t.inet :ip_address
      t.string :hostname
      t.macaddr :physical_address
      t.integer :mtu
      t.string :duplex
      t.integer :speed
      t.string :if_type
      t.timestamps
    end
  end
end
