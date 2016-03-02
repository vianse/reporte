class SucursalesController < ApplicationController
  def index
  	  #tiene acceso a todo el grupo?
 if params[:type] == "Servicio"
     @grupo = Acceso.where(:user_id => current_user.id).pluck(:group_id).first
     if @grupo.blank?
            @agencia = Acceso.where(:user_id => current_user.id).pluck(:app_id_s).first
          if @agencia.blank?
              
            else
            @apps = App.where(:api_key => @agencia).where(:type_app => params[:type])
         
         end
     else
        @apps = App.where(:group_id => @grupo).where(:type_app => params[:type])
       
     end
end
if params[:type] == "HYP"
    @grupo = Acceso.where(:user_id => current_user.id).pluck(:group_id).first
     if @grupo.blank?
        @agencia_h = Acceso.where(:user_id => current_user.id).pluck(:app_id_h).first
                  if @agencia_h.blank?
                    
                    else
                    @apps = App.where(:api_key => @agencia_h).where(:type_app => params[:type])
                 end

    else
        @apps = App.where(:group_id => @grupo).where(:type_app => params[:type])
        
    end
  end
if params[:type] == "Garantias"
  
            @agencia = Acceso.where(:user_id => current_user.id).pluck(:garantias)
            logger.debug "Agencia #{@agencia}"
          if @agencia.blank?
              
            else
            @apps = App.where(:api_key => @agencia).where(:type_app => "Servicio")
         
         end
      end
  end
end
