class Clti < ActiveRecord::Migration
  def self.up

    create_table(:class_table_inheritance, :id => false) do |t|
      t.column :parent_relation, :string, :null => false
      t.column :child_aggregate_view, :string, :null => false
      t.column :child_relation, :string, :null => false
    end

    execute "ALTER TABLE class_table_inheritance ADD PRIMARY KEY (parent_relation, child_aggregate_view, child_relation)"
    execute "ALTER TABLE class_table_inheritance ADD UNIQUE (child_aggregate_view)"
    execute "ALTER TABLE class_table_inheritance ADD UNIQUE (parent_relation, child_aggregate_view)"
  end

  def self.down
  end
end
