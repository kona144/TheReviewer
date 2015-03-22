class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :email
      t.string :name
      t.string :surname
      t.string :profile_pic
      t.string :salt
      t.string :password_hash
    end
  end
end
