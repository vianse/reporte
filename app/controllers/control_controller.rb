class ControlController < ApplicationController
 def index
   if user_signed_in?
      redirect_to "/home"
    else
      if sistema_signed_in?
        redirect_to "/apps"
      else
        redirect_to "/inicio"
      end

   end
    
 end
end