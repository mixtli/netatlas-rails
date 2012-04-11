# encoding: UTF-8
# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20120410120417) do

  create_table "class_table_inheritance", :id => false, :force => true do |t|
    t.string "parent_relation",      :null => false
    t.string "child_aggregate_view", :null => false
    t.string "child_relation",       :null => false
  end

  add_index "class_table_inheritance", ["child_aggregate_view"], :name => "class_table_inheritance_child_aggregate_view_key", :unique => true
  add_index "class_table_inheritance", ["parent_relation", "child_aggregate_view"], :name => "class_table_inheritance_parent_relation_child_aggregate_vie_key", :unique => true

  create_table "devices", :force => true do |t|
    t.string  "hostname"
    t.boolean "ip_forwarding"
    t.string  "os"
    t.string  "os_version"
    t.string  "os_type"
    t.string  "os_vendor"
    t.string  "community"
    t.string  "auth_protocol"
    t.string  "auth_password"
    t.string  "priv_protocol"
    t.string  "priv_password"
    t.string  "sys_name"
    t.string  "sys_description"
    t.string  "sys_contact"
    t.string  "sys_location"
    t.integer "memory"
    t.integer "num_cpus"
    t.string  "snmp_version"
  end

  create_table "nodes", :force => true do |t|
    t.string   "label",       :limit => 32,                        :null => false
    t.text     "description"
    t.string   "type",        :limit => 32
    t.string   "state",       :limit => 16, :default => "unknown"
    t.integer  "device_id"
    t.integer  "snmp_index"
    t.integer  "creator_id"
    t.integer  "updater_id"
    t.integer  "deleter_id"
    t.datetime "created_at",                                       :null => false
    t.datetime "updated_at",                                       :null => false
    t.datetime "deleted_at"
  end

  add_index "nodes", ["device_id"], :name => "index_nodes_on_device_id"
  add_index "nodes", ["label"], :name => "index_nodes_on_label"
  add_index "nodes", ["snmp_index"], :name => "index_nodes_on_snmp_index"
  add_index "nodes", ["state"], :name => "index_nodes_on_state"
  add_index "nodes", ["type"], :name => "index_nodes_on_type"

  create_table "pollers", :force => true do |t|
    t.string   "hostname"
    t.integer  "port"
    t.string   "state",          :limit => 16
    t.string   "queue_username", :limit => 32, :null => false
    t.string   "queue_password", :limit => 32, :null => false
    t.integer  "creator_id"
    t.integer  "updater_id"
    t.integer  "deleter_id"
    t.datetime "created_at",                   :null => false
    t.datetime "updated_at",                   :null => false
    t.datetime "deleted_at"
  end

  add_index "pollers", ["hostname"], :name => "index_pollers_on_hostname"

  create_table "users", :force => true do |t|
    t.string   "email",                  :default => "",    :null => false
    t.string   "encrypted_password",     :default => "",    :null => false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          :default => 0
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.boolean  "admin",                  :default => false
    t.datetime "created_at",                                :null => false
    t.datetime "updated_at",                                :null => false
    t.datetime "deleted_at"
  end

  add_index "users", ["email"], :name => "index_users_on_email", :unique => true
  add_index "users", ["reset_password_token"], :name => "index_users_on_reset_password_token", :unique => true

  create_view "view_devices", "SELECT nodes.id, nodes.label, nodes.description, nodes.type, nodes.state, nodes.device_id, nodes.snmp_index, nodes.creator_id, nodes.updater_id, nodes.deleter_id, nodes.created_at, nodes.updated_at, nodes.deleted_at, devices.hostname, devices.ip_forwarding, devices.os, devices.os_version, devices.os_type, devices.os_vendor, devices.community, devices.auth_protocol, devices.auth_password, devices.priv_protocol, devices.priv_password, devices.sys_name, devices.sys_description, devices.sys_contact, devices.sys_location, devices.memory, devices.num_cpus, devices.snmp_version FROM nodes, devices WHERE (nodes.id = devices.id);", :force => true do |v|
    v.column :id
    v.column :label
    v.column :description
    v.column :type
    v.column :state
    v.column :device_id
    v.column :snmp_index
    v.column :creator_id
    v.column :updater_id
    v.column :deleter_id
    v.column :created_at
    v.column :updated_at
    v.column :deleted_at
    v.column :hostname
    v.column :ip_forwarding
    v.column :os
    v.column :os_version
    v.column :os_type
    v.column :os_vendor
    v.column :community
    v.column :auth_protocol
    v.column :auth_password
    v.column :priv_protocol
    v.column :priv_password
    v.column :sys_name
    v.column :sys_description
    v.column :sys_contact
    v.column :sys_location
    v.column :memory
    v.column :num_cpus
    v.column :snmp_version
  end

end
