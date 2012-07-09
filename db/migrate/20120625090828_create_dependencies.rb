class CreateDependencies < ActiveRecord::Migration
  def up
    create_table :dependencies do |t|
      t.belongs_to :node
      t.belongs_to :dependency
      t.userstamps
      t.timestamps
    end
    add_index :dependencies, :node_id
    add_index :dependencies, :dependency_id

     execute <<-SPROC
     CREATE OR REPLACE FUNCTION node_dependents(id int) RETURNS TABLE(id int) AS $$
       WITH RECURSIVE
       deps AS(
         SELECT node_id, dependency_id
           FROM dependencies
           WHERE dependency_id = $1
         UNION
         SELECT parent.node_id, parent.dependency_id 
           FROM deps
           JOIN dependencies AS parent ON deps.node_id = parent.dependency_id
       )
       SELECT node_id FROM deps
     $$ LANGUAGE sql STABLE STRICT ROWS 100 COST 1;

     CREATE OR REPLACE FUNCTION node_dependencies(id int) RETURNS TABLE(id int) AS $$
       WITH RECURSIVE
       deps AS(
         SELECT node_id, dependency_id
           FROM dependencies
           WHERE dependencies.node_id = $1
         UNION
         SELECT parent.node_id, parent.dependency_id
           FROM deps 
           JOIN dependencies AS parent ON parent.node_id = deps.dependency_id
       )    
       SELECT dependency_id FROM deps;
     $$ LANGUAGE sql STABLE STRICT ROWS 100 COST 1;

 SPROC



  end

  def down
    execute  "DROP FUNCTION IF EXISTS node_dependents(integer);"
    execute  "DROP FUNCTION IF EXISTS node_dependencies(integer);"
    drop_table :dependencies
  end
end
