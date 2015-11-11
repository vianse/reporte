class Api::V1::GetObjetivoRealController <ApplicationController
  include ActionView::Helpers::NumberHelper
	def index
		@mes = Date.today.month
		@app = App.select("api_key").where(:user_id => current_user.id)
		@acceso = Acceso.select("app_id").where(:user_id => current_user.id)
		if @acceso.blank?
			render json: {
				:objetivo => "0.00"
			}
		else
			@catalogo = Catalogo.select("objetivo_real").where(:mes => @mes).where(:app_id => @acceso)
			@moneda = number_to_currency(@catalogo[0].objetivo_real)
			render json:  {
				:objetivo => @moneda
			}
		end
	end
	
end