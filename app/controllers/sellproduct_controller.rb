class SellproductController < ApplicationController
  #include ApplicationHelper
  protect_from_forgery
  layout "user"
  
  def viewsellproduct
    @sellproduct=Sellproduct.where(:user_id=>session[:user_id])
    @category=Category.all                                 
  end
  
  def remove_all
    
    @sellproduct=Sellproduct.find(params[:Sid])
        puts"%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%#{@stuff.inspect}"
    respond_to do |format|    
    
    if @sellproduct.present?
      #@stuff.destroy
      @sellproduct.each do |s|
        s.destroy
      end
      
       format.json {render :json=>@sellproduct}
    
    else
      
      format.json {render :json=>false}
       
    end
    
    end
    
  end 
  
end
