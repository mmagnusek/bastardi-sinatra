class CreateDistricts < ActiveRecord::Migration
  def self.up
    create_table :districts do |t|
      t.string :name
    end
    add_column :answers, :district_id, :integer
  end

  def self.down
    remove_column :answers, :district_id
    drop_table :districts
  end
end
