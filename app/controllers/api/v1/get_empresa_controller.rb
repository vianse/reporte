class Api::V1::GetEmpresaController <ApplicationController
	def index
		@acceso = Acceso.select("app_id").where(:user_id => current_user.id)
		if @acceso.blank?
			render json: {
				:name => "Sin Acceso"
			}
		else
			@empresa = App.select("name").where(:api_key => @acceso).first
			render json: {
				:name => @empresa.name
			}
			
		end
	end	
end