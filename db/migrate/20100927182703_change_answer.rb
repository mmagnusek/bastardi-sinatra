class ChangeAnswer < ActiveRecord::Migration
  def self.up
    add_column :answers, :name, :string
    add_column :answers, :question1, :string
    add_column :answers, :question2, :string
    add_column :answers, :question3, :string
    remove_column :answers, :message
  end

  def self.down
    remove_column :answers, :name, :string
    remove_column :answers, :question1, :string
    remove_column :answers, :question2, :string
    remove_column :answers, :question3, :string
    add_column :answers, :message, :text
  end
end
