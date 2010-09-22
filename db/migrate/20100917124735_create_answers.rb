class CreateAnswers < ActiveRecord::Migration
  def self.up
    create_table :answers do |t|
      t.string :email
      t.text :message
      t.integer :points
      t.datetime :created_at
    end

  end

  def self.down
    drop_table :anwers
  end
end
