class CreateGraphTemplateItems < ActiveRecord::Migration
  def change
    create_table :graph_template_items do |t|
      t.belongs_to :graph_template, index: true
      t.belongs_to :data_template, index: true
      t.json :options
      t.userstamps
      t.timestamps
    end
  end
end
