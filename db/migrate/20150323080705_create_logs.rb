class CreateLogs < ActiveRecord::Migration
  def change
    create_table :logs do |t|
      t.string :action
      t.string :time
      t.string :user_id
      t.string :user_ip
    end
  end
end
