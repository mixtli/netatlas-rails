class CreateServiceTypes < ActiveRecord::Migration
  def change
    create_table :service_types do |t|
      t.string :name
      t.integer :default_port
      t.belongs_to :default_template
      t.text :description

      t.timestamps
    end
    add_index :service_types, :default_template_id
  end
end
