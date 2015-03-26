class Log < ActiveRecord::Base
validates_presence_of :action,:time,:user_id,:user_ip

def self.create_log(action,time,user_id,user_ip)
	

self.create(
  action:action,
      time:time,
      user_id:user_id,
      user_ip:user_ip

	)
end


end