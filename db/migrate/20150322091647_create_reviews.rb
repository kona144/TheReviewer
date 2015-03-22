class CreateReviews < ActiveRecord::Migration
  def change
    create_table :reviews do |t|
      t.string :title
      t.string :content
      t.string :review_pic
      t.string :user_id
    end
  end
end
