class CreateServices < ActiveRecord::Migration
  def change
    create_table :services, :id => false, :options => "INHERITS(nodes)" do |t|
      t.integer :port
      t.belongs_to :service_type
    end
  end
end
