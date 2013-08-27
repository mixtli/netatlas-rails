class CreateGraphTemplates < ActiveRecord::Migration
  def change
    create_table :graph_templates do |t|
      t.string :title
      t.json :options
      t.timestamps
      t.userstamps
    end
  end
end
