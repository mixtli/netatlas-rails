class CreateDevices < ActiveRecord::Migration
  def change
    create_table :devices, :id => false, :options => "INHERITS(nodes)" do |t|
      t.string :hostname
      t.inet :ip_address
      t.string :community
      t.string :auth_protocol
      t.string :auth_password
      t.string :priv_protocol
      t.string :priv_password
      t.string :snmp_version
    end
  end
end
