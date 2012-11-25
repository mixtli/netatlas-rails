class CreateContacts < ActiveRecord::Migration
  def change
    create_table :contacts do |t|
      t.belongs_to :user
      t.string :type
      t.string :status, :default => "active"
      t.string :username
      t.string :password
      t.string :email
      t.string :url
      t.userstamps
      t.timestamps
    end
    add_index :contacts, :user_id
  end
end
