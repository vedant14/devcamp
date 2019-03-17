module CurrentUserConcern
  extend ActiveSupport::Concern

 def current_user
   super || guest_user
 end  
 
 def guest_user
   OpenStruct.new(email: "example@example.com", 
                  name: "Guest User", 
                  first_name: "Guest", 
                  last_name: "User"
                  )
 end
end