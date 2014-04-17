class StuffController < ApplicationController
  protect_from_forgery
  layout "user"
  
  def new
    
  end
  
  def viewall
    @stuff=Stuff.all
     @category=Category.all
  end

  def create
    
    puts"%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%#{session[:user_id].inspect}"
    @stuff=Stuff.new
    @stuff.user_id=params[:Uid]
    @stuff.category_id=params[:Cid]
    @stuff.brand=params[:Brand]
    @stuff.model=params[:Model]
    @stuff.name=params[:Name]
    @stuff.description=params[:Desc]
    @stuff.price=params[:Price]
    @stuff.date_of_purchase=params[:Dop]
    @stuff.is_user_category=false
    
      respond_to do |format|    
    
    if @stuff.save
       format.json {render :json=>@stuff}
    
    else
      
      format.json {render :json=>false}
       
    end
    end
    
  end

  def edit
    @stuff=Stuff.where(:id=>params[:Sid]).first
    
    respond_to do |format|    
    
    if @stuff
       format.json {render :json=>@stuff}
    else
       format.json {render :json=>false}
    end
    
    end
    
  end
  
  def update
    @stuff=Stuff.find(params[:Sid])
    @stuff.update_attributes(:brand=>params[:Brand],:name=>params[:Name],:model=>params[:Model],:price=>params[:Price],:description=>params[:Desc],:date_of_purchase=>params[:Dop],:category_id=>params[:Cid])
  
  respond_to do |format|    
    
    if @stuff.save
       format.json {render :json=>@stuff}
    
    else
      
      format.json {render :json=>false}
       
    end
    
    end
  
  end
  def delete
    
    @stuff=Stuff.destroy_all(:id=>params[:Sid])
    
    respond_to do |format|    
    
    if @stuff
       format.json {render :json=>@stuff}
    
    else
      
      format.json {render :json=>false}
       
    end
    
    end
  

  end
  
  def delete_all
    
    puts"%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%#{params.inspect}"
    @stuff=Stuff.find(params[:Sid])
        puts"%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%#{@stuff.inspect}"
    respond_to do |format|    
    
    if @stuff.present?
      #@stuff.destroy
      @stuff.each do |s|
        s.destroy
      end
      
       format.json {render :json=>@stuff}
    
    else
      
      format.json {render :json=>false}
       
    end
    
    end
  

  end
  
  def add_to_sell
    
    puts"%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%#{params.inspect}"
   
    params[:Sid].each do |p|
         
    @sellproduct=Sellproduct.new
    @sellproduct.stuff_id=p
    @sellproduct.user_id=params[:Userid]
    @sellproduct.save
   
    end
   
    respond_to do |format|    
    
         format.json {render :json=>@sellproduct}
     
    end
    
  end
  
  def all_category
        @category=Category.all
        respond_to do |format|    
    
         format.json {render :json=>@category}
     
    end
        

  end
  
  def add_category
    @category=Category.new
    @category.name=params[:Name]
    @category.description=params[:Desc]
    respond_to do |format|    
    
    if @category.save
       format.json {render :json=>@category}
    
    else
      
      format.json {render :json=>false}
       
    end
    
    end
    
    
  end
  
  def add_security
    
     puts "%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%#{params.inspect}"
     
     @stuffsecurity=Stuffsecurity.create(security_params)
     
     if @stuffsecurity.save
       
          
   
    # params[:Sid].each do |p|
    #          
    # @sellproduct=Sellproduct.new
    # @sellproduct.stuff_id=p
    # @sellproduct.user_id=params[:Userid]
    # @sellproduct.save
    #    
    # end
   
    respond_to do |format|    
    
         format.json {render :json=>@stuffsecurity}
     
    end
    
    end
    
  end
    
    private 
    def security_params
      params.permit(:stuf_id,:bill_no,:insurance_no,:emi_no,:ins_valid_till,:document)
    end
  
  
  
end
