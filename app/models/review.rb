class Review < ActiveRecord::Base
validates_presence_of :title,:content,:user_id

def self.create_review(title,content,user_id)
	

self.create(
title:title,
content:content,
user_id:user_id

	)
end


end