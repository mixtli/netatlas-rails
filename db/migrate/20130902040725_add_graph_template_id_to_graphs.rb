class AddGraphTemplateIdToGraphs < ActiveRecord::Migration
  def change
    add_column :graphs, :graph_template_id, :integer
    add_index :graphs, :graph_template_id
  end
end
