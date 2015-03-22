class Comment < ActiveRecord::Base
validates_presence_of :content ,:user_id, :review_id

def self.create_comment(content,user_id,review_id)
	

self.create(
content:content,
user_id:user_id,
review_id:review_id

	)
end


end