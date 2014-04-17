class SessionController < ApplicationController
  layout "user"
  def new
           @category=Category.all
         
  end
  
  def create
    
   user = User.authenticate(params[:user][:email], params[:user][:password])
   
   
   puts"%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%#{user.inspect}"
   
   if user
    session[:user_id] = user.id
     puts"%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%#{session[:user_id].inspect}"
    redirect_to user_home_path, :notice => "Logged in!"
   else
    flash.now.alert = "Invalid email or password"
    render "new"
   end
   
  end
  
  
end
