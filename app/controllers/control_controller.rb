class ControlController < ApplicationController
 def index
   if user_signed_in?
   	@grupo = Acceso.select("group_id").where(:user_id => current_user.id).pluck(:group_id).first
      if @grupo.blank?
        @app_id_s = Acceso.select("app_id_s").where(:user_id => current_user.id).pluck(:app_id_s).first
        if @app_id_s.blank?
          @app_id_h = Acceso.select("app_id_h").where(:user_id => current_user.id).pluck(:app_id_h).first
          if @app_id_h.blank?
            @asesor = Acceso.select("asesor").where(:user_id => current_user.id).pluck(:asesor).first
             if @asesor.blank?
              @garantias = Acceso.select("garantias").where(:user_id => current_user.id).pluck(:garantias).first
             if @garantias.blank?
             redirect_to "/errors/sucursal"
             else
              redirect_to "/garantias?app_id=" + @garantias
             end

             else
              redirect_to "/asesores?app_id=" + @asesor
             end
          else
             redirect_to "/home_hyp?app_id=" + @app_id_h + "&type=HYP"
          end
        else
          redirect_to "/home?app_id="+ @app_id_s + "&type=Servicio"
        end
      else
        redirect_to "/general?group_id=" + @grupo
      end
    else
      if sistema_signed_in?
        redirect_to "/panel"
      else
        if super_signed_in?
        redirect_to "/administracion"
        else
        redirect_to "/inicio"
        end
      end

   end
    
 end
end