class Api::V1::GetCostoController <ApplicationController
	include ActionView::Helpers::NumberHelper
	def index
		@parametro = params[:app_id]
		@app = App.select("api_key").where(:user_id => current_user.id)
		@acceso = Acceso.select("app_id").where(:user_id => current_user.id)
		@catalogo = Pendiente.select("importe").where(:app_id => @parametro).sum(:importe)
		@moneda = number_to_currency(@catalogo)
		render json:  {
			:costo => @moneda
		}
	end
	
end