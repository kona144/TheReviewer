class AddNewColumnToMyTable < ActiveRecord::Migration
  def change

  end

  def self.up
  add_column :users, :admin, :string
end
end
