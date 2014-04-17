module ApplicationHelper
   def getDetailById(id)
     @sellp=Stuff.find(id)
     return @sellp
   end
   
   def getCategoryNameById(id)
     @cate=Category.find(id)
     return @cate
   end
  
  
  
end
