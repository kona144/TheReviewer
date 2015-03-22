class User < ActiveRecord::Base

validates_presence_of :name,:surname,:email,:salt,:password_hash
validates_uniqueness_of :email

def self.create_with_password(name,surname,email,password)
	salt=SecureRandom.hex
	password_hash= generate_hash(password,salt)

self.create(
name:name,
surname:surname,
email:email,
salt: salt,
password_hash: password_hash

	)
end

def verify_password(password)

self.password_hash == User.generate_hash(password, self.salt)

end

def self.generate_hash(password, salt)
digest = OpenSSL::Digest::SHA256.new
digest.update(password)
digest.update(salt)
digest.to_s
end
end