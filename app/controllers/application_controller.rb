class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.

  skip_before_action :verify_authenticity_token
  def log
  end
def logs
if session[:signed_in] == true

admin=User.where(email: session[:email]).first

if admin.admin != "1"

redirect_to '/home'

  end


else
  redirect_to '/index'
end
  

end

def my_reviews

if session[:signed_in] == true

else
  redirect_to '/index'
end
  




end
def create_comment


user = User.where(email: session[:email]).first


content = params[:content]
user_id = user.id
review_id=params[:review_id]

comment = Comment.create_comment(content,user_id,review_id)

if comment
  

  redirect_to '/review.'+review_id
  else
    redirect_to '/review#unsuccessfull'
  end


end


def review

if session[:signed_in] == true

else
  redirect_to '/index'
end

id=request.original_url 

id=id.split('.')[-1]

@comments=Comment.where(review_id: id).all


end



  def index

  	if session[:signed_in] == true
redirect_to '/home'
else
	
end


end

  def home


if session[:signed_in] == true

else
	redirect_to '/index'
end

@reviews=Review.all



  end

  def profile

	if session[:signed_in] == true

	else
		redirect_to '/index'
	end

  end


def new_review
      if session[:signed_in] == true

else
  redirect_to '/index'
end


  end

def create_review

user = User.where(email: session[:email]).first

title = params[:title]
content = params[:content]
user_id = user.id
review_pic="review_zvezda.jpg"

review = Review.create_review(title,content,review_pic,user_id)

if review

uploaded_io = params[:picture]
  File.open(Rails.root.join('public', 'uploads', 'reviews' , review.id.to_s + uploaded_io.original_filename), 'wb') do |file|
    file.write(uploaded_io.read)
review_image=review.id.to_s + uploaded_io.original_filename
    review.review_pic=review_image
    review.save
  end
  redirect_to '/home#services'
    redirect_to '/new_review'
  end

  end

  
  def create_user #register and then login

name = params[:name]
surname = params[:surname]
email =params[:email]
password =params[:password]
profile_pic="zvezda.jpg"
password_confirmation =params[:password_confirmation]
existing_email=User.where(email: email).first
if(existing_email != email)
if(password == password_confirmation)

user = User.create_with_password(name,surname,email,profile_pic,password)
if user
	session[:signed_in] = true
	session[:email] = user.email
	redirect_to '/home'
	else
		redirect_to '/index' #neusprešno ustvarjen user
	end
	else
		redirect_to '/index' #gesla nista enaka
end
else

redirect_to '/index' #email obstaja

  end
end

  def logout

 session[:signed_in] = false
 redirect_to '/index#services'

  end
def login 
@email = params[:email]
@password = params[:password]

user = User.where(email: @email).first #če obstaja user
if user 
valid = user.verify_password(@password)
if valid #če je pass uredu
	session[:signed_in] = true 
	session[:email] = params[:email]
	redirect_to '/home' 
else 
	redirect_to '/index'
end 
else redirect_to '/index' 
end 
end 




def profile_pic_upload
  user = User.where(email: session[:email]).first
    uploaded_io = params[:picture]
  File.open(Rails.root.join('public', 'uploads', 'profiles' , user.id.to_s + uploaded_io.original_filename), 'wb') do |file|
    file.write(uploaded_io.read)
    user_image=user.id.to_s + uploaded_io.original_filename
    user.profile_pic=user_image
    user.save
    redirect_to '/profile'
  end
  end

  def change_name
  user = User.where(email: session[:email]).first
  user.name= params[:name]
  user.save
redirect_to '/profile#services'



end
def change_surname
 user = User.where(email: session[:email]).first
  user.surname= params[:surname]
  user.save
redirect_to '/profile#services'



  end


  def change_password

password =params[:password]
password_confirmation =params[:password_confirm]

      if password == password_confirmation

         user = User.where(email: session[:email]).first
         salt=user.salt
         digest = OpenSSL::Digest::SHA256.new
password_hashed=digest.update(password)
password_hashed=digest.update(salt)
password_hashed=digest.to_s

         

         user.password_hash=password_hashed

         user.save
  redirect_to '/profile#services'

      else
#passwords dont match

 redirect_to '/profile#passwordsdontmatch'

      end


  end


def change_title

review=Review.find(params[:review_id])
review.title=params[:title]
review.save
redirect_to '/my_reviews#services'

end

def change_content

review=Review.find(params[:review_id])
review.content=params[:content]
review.save
redirect_to '/my_reviews#services'

end

def review_pic_upload
  review=Review.find(params[:review_id])
    uploaded_io = params[:picture]
  File.open(Rails.root.join('public', 'uploads', 'reviews' , review.id.to_s + uploaded_io.original_filename), 'wb') do |file|
    file.write(uploaded_io.read)
    review_image=review.id.to_s + uploaded_io.original_filename
    review.review_pic=review_image
    review.save
    redirect_to '/my_reviews'
  end
end

def remove_review
review=Review.find(params[:review_id])
review.destroy
redirect_to '/my_reviews#services'

end


end