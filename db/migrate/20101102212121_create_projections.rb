class CreateProjections < ActiveRecord::Migration
  def self.up
    create_table :projections do |t|
      t.date :date
      t.string :location
    end
  end

  def self.down
    drop_table :projections
  end
end
