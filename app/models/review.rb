class Review < ActiveRecord::Base
validates_presence_of :title,:content,:user_id

def self.create_review(title,content,review_pic,user_id)
	

self.create(
title:title,
content:content,
review_pic:review_pic,
user_id:user_id

	)
end


end