class Api::V1::GetEmpresaController <ApplicationController
	def index
		@acceso = Acceso.where(:user_id => current_user.id).pluck(:app_id)
		@pago = Payment.where(:app_id => @acceso).pluck(:estatus)
		if @acceso.blank?
			render json: {
				:name => "Sin Acceso"
			}
		else
		if @pago == "sin pago"
			render json: {
				:name => "Favor de realizar su pago"
			}
		else
			@empresa = App.select("name").where(:api_key => @acceso).first
			render json: {
				:name => @empresa.name
			}
		end
		end
	end	
end