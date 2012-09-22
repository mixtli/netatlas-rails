class CreateServices < ActiveRecord::Migration
  def change
    create_table :services, :id => false, :options => "INHERITS(nodes)" do |t|
    end
  end
end
