class Api::V1::SucursalesController <ApplicationController
 skip_before_filter :verify_authenticity_token
	def index
    #tiene acceso a todo el grupo?
 if params[:type] == "Servicio"
     @grupo = Acceso.where(:user_id => current_user.id).pluck(:group_id).first
     if @grupo.blank?
            @agencia = Acceso.where(:user_id => current_user.id).pluck(:app_id_s).first
          if @agencia.blank?
              render json: {:message => "No tiene acceso"}
            else
            @apps = App.where(:api_key => @agencia).where(:type_app => params[:type])
            elementos = @apps.map do |k|
             {   
             :sucursal => k.name,
             :app_id => k.api_key,
             :type => k.type_app,

             }
            end
             render json: elementos
         end
     else
        @apps = App.where(:group_id => @grupo).where(:type_app => params[:type])
        elementos = @apps.map do |k|
             {   
             :sucursal => k.name,
             :app_id => k.api_key,
             :type => k.type_app
             }
             end
             render json: elementos
     end
end
if params[:type] == "HYP"
@grupo = Acceso.where(:user_id => current_user.id).pluck(:group_id).first
     if @grupo.blank?
        @agencia_h = Acceso.where(:user_id => current_user.id).pluck(:app_id_h).first
                  if @agencia_h.blank?
                    render json: {:message => "No tiene acceso"}
                    else
                    @apps = App.where(:api_key => @agencia_h).where(:type_app => params[:type])
                    elementos = @apps.map do |k|
                     {   
                     :sucursal => k.name,
                     :app_id => k.api_key,
                     :type => k.type_app,

                     }
                    end
                     render json: elementos
                 end

    else
        @apps = App.where(:group_id => @grupo).where(:type_app => params[:type])
        elementos = @apps.map do |k|
             {   
             :sucursal => k.name,
             :app_id => k.api_key,
             :type => k.type_app
             }
             end
             render json: elementos
  end
end


	   # @acceso = Acceso.select("app_id").where(:user_id => current_user.id)
    #    @apps = App.where(:api_key => @acceso)
    #     elementos = @apps.map do |k|
    #         {   
    #         :sucursal => k.name,
    #         :app_id => k.api_key
    #         }
    #         end
    #         render json: elementos
     end
end