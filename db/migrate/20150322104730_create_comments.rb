class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.string :content
      t.string :user_id
      t.string :review_id
    end
  end
end
