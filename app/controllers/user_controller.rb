class UserController < ApplicationController
  protect_from_forgery
  layout "user"
  def index
    #render :layout=>"application"
        @category=Category.all
        @stuff=Stuff.new
        @stuff=Stuff.where(:user_id=>session[:user_id])
  
  end

  def new
    @user=User.new
    @category=Category.all
  end
  
  def create 
    
    puts"$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$#{params.inspect}"

    @user=User.create(user_params)
        
    
    if @user.save 
      if params[:category_ids].present? 
        
          @usercategory=Usercategory.new
      @usercategory.user_id=@user.id
      @usercategory.category_id=params[:category_ids].join(',')
      
     if @usercategory.save
          redirect_to root_url, :notice=>"You SignedUp Successfully Please do login"
     else
       render "new"
     end
      
      else
       redirect_to root_url, :notice=>"You SignedUp Successfully Please do login"
      end
      
          
      
    else
      render "new"
    end
    
  end
  
  
  def check_useremail
    @user=User.where(:email=>params[:Uemail]).first
    
      respond_to do |format|
   if @user.present?
        format.json {render :json=>@user}
   else 
     @status="false"
     format.json {render :json=>@status}
     
    end
   end
    
  end
   
   def logout
     
     session[:user_id]=nil 
     redirect_to root_url, :layout=>"application",:notice=>"Logged Off Successfuly"     
   end
  
  private
  
  
  def user_params
   
    params.require(:user).permit(:first_name,:last_name,:email,:password,:password_hash,:password_salt,:mobile_no,:profile_pic)
  end
  
end
