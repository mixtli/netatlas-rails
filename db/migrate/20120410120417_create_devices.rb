class CreateDevices < ActiveRecord::Migration
  def change
    create_table :devices do |t|
      t.string :hostname
      t.boolean :ip_forwarding
      t.string :os
      t.string :os_version
      t.string :os_type
      t.string :os_vendor
      t.string :community
      t.string :auth_protocol
      t.string :auth_password
      t.string :priv_protocol
      t.string :priv_password
      t.string :sys_name
      t.string :sys_description
      t.string :sys_contact
      t.string :sys_location
      t.integer :memory
      t.integer :num_cpus
      t.string :snmp_version
    end
    create_citier_view(Device)
  end
end