class Api::V1::GetPorcentajeController <ApplicationController
	def index
		@mes = Date.today.month
		@año = Date.today.month
		@app = App.select("api_key").where(:user_id => current_user.id)
		@acceso = Acceso.select("app_id").where(:user_id => current_user.id)
		@catalogo = Catalogo.where(:mes => @mes).where(:app_id => @acceso).pluck(:objetivo_obligado).first
		@facturado = Facturada.where(:app_id => @acceso).sum(:importe)
		@total = (@facturado / @catalogo) * 100
		render json:  @total.to_i
	end
	
end