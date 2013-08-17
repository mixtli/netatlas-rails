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

ActiveRecord::Schema.define(:version => 20120628072738) do

  create_table "commands", :force => true do |t|
    t.string   "name",       :null => false
    t.integer  "poller_id",  :null => false
    t.string   "state",      :null => false
    t.text     "arguments"
    t.text     "message"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
    t.datetime "deleted_at"
    t.integer  "creator_id"
    t.integer  "updater_id"
  end

  add_index "commands", ["poller_id"], :name => "index_commands_on_poller_id"

  create_table "data_sources", :force => true do |t|
    t.integer  "node_id",                                           :null => false
    t.integer  "plugin_id",                                         :null => false
    t.integer  "data_template_id"
    t.string   "state",              :limit => 16,                  :null => false
    t.datetime "last_polled_at"
    t.integer  "interval",                         :default => 300, :null => false
    t.text     "description"
    t.text     "arguments"
    t.text     "varbinds"
    t.float    "warning_threshold"
    t.float    "critical_threshold"
    t.string   "operator",           :limit => 8,  :default => ">"
    t.datetime "created_at",                                        :null => false
    t.datetime "updated_at",                                        :null => false
    t.datetime "deleted_at"
  end

  add_index "data_sources", ["data_template_id"], :name => "index_data_sources_on_data_template_id"
  add_index "data_sources", ["node_id"], :name => "index_data_sources_on_node_id"
  add_index "data_sources", ["plugin_id"], :name => "index_data_sources_on_plugin_id"

  create_table "data_streams", :force => true do |t|
    t.integer  "data_source_id"
    t.integer  "poller_id"
    t.integer  "creator_id"
    t.integer  "updater_id"
    t.integer  "deleter_id"
    t.datetime "created_at",     :null => false
    t.datetime "updated_at",     :null => false
    t.datetime "deleted_at"
  end

  add_index "data_streams", ["data_source_id"], :name => "index_data_streams_on_data_source_id"
  add_index "data_streams", ["poller_id"], :name => "index_data_streams_on_poller_id"

  create_table "data_templates", :force => true do |t|
    t.string   "name",                                :null => false
    t.integer  "plugin_id",                           :null => false
    t.integer  "interval",           :default => 300, :null => false
    t.float    "warning_threshold"
    t.float    "critical_threshold"
    t.string   "operator",           :default => ">"
    t.text     "description"
    t.text     "arguments"
    t.integer  "creator_id"
    t.integer  "updater_id"
    t.datetime "created_at",                          :null => false
    t.datetime "updated_at",                          :null => false
    t.datetime "deleted_at"
  end

  add_index "data_templates", ["name"], :name => "index_data_templates_on_name"
  add_index "data_templates", ["plugin_id"], :name => "index_data_templates_on_plugin_id"

  create_table "dependencies", :force => true do |t|
    t.integer  "node_id"
    t.integer  "dependency_id"
    t.integer  "creator_id"
    t.integer  "updater_id"
    t.datetime "created_at",    :null => false
    t.datetime "updated_at",    :null => false
    t.datetime "deleted_at"
  end

  add_index "dependencies", ["dependency_id"], :name => "index_dependencies_on_dependency_id"
  add_index "dependencies", ["node_id"], :name => "index_dependencies_on_node_id"

  create_table "devices", :id => false, :force => true do |t|
    t.integer  "id",                                                 :null => false
    t.string   "label",         :limit => 32,                        :null => false
    t.text     "description"
    t.string   "type",          :limit => 32
    t.string   "state",         :limit => 16, :default => "unknown"
    t.integer  "device_id"
    t.integer  "snmp_index"
    t.integer  "creator_id"
    t.integer  "updater_id"
    t.integer  "deleter_id"
    t.datetime "created_at",                                         :null => false
    t.datetime "updated_at",                                         :null => false
    t.datetime "deleted_at"
    t.string   "hostname"
    t.inet     "ip_address"
    t.boolean  "ip_forwarding"
    t.string   "os"
    t.string   "os_version"
    t.string   "os_type"
    t.string   "os_vendor"
    t.string   "community"
    t.string   "auth_protocol"
    t.string   "auth_password"
    t.string   "priv_protocol"
    t.string   "priv_password"
    t.string   "sys_name"
    t.string   "sys_descr"
    t.string   "sys_contact"
    t.string   "sys_location"
    t.string   "sys_objectid"
    t.integer  "memory"
    t.integer  "num_cpus"
    t.string   "snmp_version"
  end

  create_table "events", :force => true do |t|
    t.integer  "poller_id"
    t.integer  "node_id"
    t.string   "state"
    t.integer  "repeats",            :default => 0
    t.string   "severity"
    t.text     "description"
    t.text     "additional"
    t.text     "notes"
    t.integer  "acknowledged_by_id"
    t.integer  "resolved_by_id"
    t.datetime "acknowledged_at"
    t.datetime "resolved_at"
    t.datetime "created_at",                        :null => false
    t.datetime "updated_at",                        :null => false
    t.datetime "deleted_at"
    t.integer  "creator_id"
    t.integer  "updater_id"
  end

  add_index "events", ["acknowledged_by_id"], :name => "index_events_on_acknowledged_by_id"
  add_index "events", ["node_id"], :name => "index_events_on_node_id"
  add_index "events", ["poller_id"], :name => "index_events_on_poller_id"
  add_index "events", ["resolved_by_id"], :name => "index_events_on_resolved_by_id"
  add_index "events", ["severity"], :name => "index_events_on_severity"
  add_index "events", ["state"], :name => "index_events_on_state"

  create_table "groups", :force => true do |t|
    t.string   "name"
    t.integer  "parent_id"
    t.integer  "creator_id"
    t.integer  "updater_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
    t.datetime "deleted_at"
  end

  add_index "groups", ["name"], :name => "index_groups_on_name"
  add_index "groups", ["parent_id"], :name => "index_groups_on_parent_id"

  create_table "interfaces", :id => false, :force => true do |t|
    t.integer  "id",                                                    :null => false
    t.string   "label",            :limit => 32,                        :null => false
    t.text     "description"
    t.string   "type",             :limit => 32
    t.string   "state",            :limit => 16, :default => "unknown"
    t.integer  "device_id"
    t.integer  "snmp_index"
    t.integer  "creator_id"
    t.integer  "updater_id"
    t.integer  "deleter_id"
    t.datetime "created_at",                                            :null => false
    t.datetime "updated_at",                                            :null => false
    t.datetime "deleted_at"
    t.inet     "ip_address"
    t.string   "hostname"
    t.integer  "if_speed"
    t.integer  "if_type"
    t.string   "if_name"
    t.string   "if_alias"
    t.string   "if_descr"
    t.boolean  "if_promiscuous"
    t.integer  "if_high_speed"
    t.string   "if_admin_status"
    t.macaddr  "physical_address"
    t.integer  "mtu"
    t.string   "duplex"
  end

  create_table "memberships", :force => true do |t|
    t.integer  "group_id"
    t.integer  "node_id"
    t.integer  "creator_id"
    t.integer  "updater_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
    t.datetime "deleted_at"
  end

  add_index "memberships", ["creator_id"], :name => "index_memberships_on_creator_id"
  add_index "memberships", ["group_id"], :name => "index_memberships_on_group_id"
  add_index "memberships", ["node_id"], :name => "index_memberships_on_node_id"
  add_index "memberships", ["updater_id"], :name => "index_memberships_on_updater_id"

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

  create_table "plugins", :force => true do |t|
    t.string   "name"
    t.string   "class_name"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
    t.datetime "deleted_at"
    t.integer  "creator_id"
    t.integer  "updater_id"
  end

  add_index "plugins", ["class_name"], :name => "index_plugins_on_class_name"
  add_index "plugins", ["name"], :name => "index_plugins_on_name"

  create_table "poller_nodes", :force => true do |t|
    t.integer  "poller_id"
    t.integer  "node_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
    t.datetime "deleted_at"
  end

  add_index "poller_nodes", ["node_id"], :name => "index_poller_nodes_on_node_id"
  add_index "poller_nodes", ["poller_id"], :name => "index_poller_nodes_on_poller_id"

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

  create_table "subscriptions", :force => true do |t|
    t.integer  "group_id"
    t.integer  "poller_id"
    t.integer  "node_id"
    t.string   "state"
    t.string   "severity"
    t.integer  "creator_id"
    t.integer  "updater_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
    t.datetime "deleted_at"
  end

  add_index "subscriptions", ["creator_id"], :name => "index_subscriptions_on_creator_id"
  add_index "subscriptions", ["group_id"], :name => "index_subscriptions_on_group_id"
  add_index "subscriptions", ["node_id"], :name => "index_subscriptions_on_node_id"
  add_index "subscriptions", ["poller_id"], :name => "index_subscriptions_on_poller_id"
  add_index "subscriptions", ["severity"], :name => "index_subscriptions_on_severity"
  add_index "subscriptions", ["state"], :name => "index_subscriptions_on_state"
  add_index "subscriptions", ["updater_id"], :name => "index_subscriptions_on_updater_id"

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

end
