class Api::V1::RandomOrdenPronosticosController <ApplicationController
	include ActionView::Helpers::NumberHelper
	def index
		@app = App.select("api_key").where(:user_id => current_user.id)
		@acceso = Acceso.select("app_id").where(:user_id => current_user.id)
		@random = rand(1..9)
		@conteo = Pendiente.where(:app_id => @acceso).count(:id)
		@total = @conteo- @random 
		
		@ordenes = Pendiente.select("orden","importe").where(:app_id => @acceso).order("RANDOM()").limit(@random)
		@moneda = @ordenes.map {|s| s['importe']}.reduce(0, :+)
			elementos = @ordenes.map do |k|
			{	
			:ordenes => k.orden,
			:total => number_to_currency(@moneda),
			:totalordenes => @total
			}
			end
			render json: elementos
	end
end