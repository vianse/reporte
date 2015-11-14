class Api::V1::GetFacturasController <ApplicationController
	include ActionView::Helpers::NumberHelper
	def index
		@año = Date.today.year
		@mes = Date.today.month
		@app = App.select("api_key").where(:user_id => current_user.id)
		@acceso = Acceso.select("app_id").where(:user_id => current_user.id)
		@catalogo = Facturada.where(:app_id => @acceso).where(:mes => @mes).where(:año => @año).sum(:importe)
		@moneda = number_to_currency(@catalogo)

		render json: {
			:costo => @moneda
		}
		
	end
	
	
end