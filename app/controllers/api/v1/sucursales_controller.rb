class Api::V1::SucursalesController <ApplicationController
 skip_before_filter :verify_authenticity_token
	def index
	   @acceso = Acceso.select("app_id").where(:user_id => current_user.id)
       @apps = App.where(:api_key => @acceso)
        elementos = @apps.map do |k|
            {   
            :sucursal => k.name
            }
            end
            render json: elementos
    end
end