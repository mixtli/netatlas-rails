class AddColumnsForGraphs < ActiveRecord::Migration
  def change
    add_column :graph_items, :label, :string
    add_column :graph_items, :cdef, :string
    add_column :graph_items, :units, :string
    add_column :graph_template_items, :label, :string
    add_column :graph_template_items, :cdef, :string
    add_column :graph_template_items, :units, :string
  end
end
