class ControlController < ApplicationController
 def index
   if user_signed_in?
   	@grupo = Acceso.select("group_id").where(:user_id => current_user.id).pluck(:group_id).first
      if @grupo.blank?
        @app_id_s = Acceso.select("app_id_s").where(:user_id => current_user.id).pluck(:app_id_s).first
        if @app_id_s.blank?
          @app_id_h = Acceso.select("app_id_h").where(:user_id => current_user.id).pluck(:app_id_h).first
          if @app_id_h.blank?
             redirect_to "/errors/sucursal"
          else
             redirect_to "/home_hyp?app_id=" + @app_id_h
          end
        else
          redirect_to "/home?app_id="+ @app_id_s + "&type=Servicio"
        end
      else
        redirect_to "/general?group_id=" + @grupo
      end
    else
      if sistema_signed_in?
        redirect_to "/apps"
      else
        redirect_to "/inicio"
      end

   end
    
 end
end