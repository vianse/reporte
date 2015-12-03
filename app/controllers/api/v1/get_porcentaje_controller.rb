class Api::V1::GetPorcentajeController <ApplicationController
	def index
		@parametro = params[:app_id]
		@mes = Date.today.month
		@año = Date.today.year
		@app = App.select("api_key").where(:user_id => current_user.id)
		@acceso    = Acceso.select("app_id").where(:user_id => current_user.id)
		@catalogo  = Catalogo.where(:mes => @mes).where(:año => @año).where(:app_id => @parametro).pluck(:objetivo_obligado).first
		@facturado = Facturada.where(:app_id => @parametro).where(:mes => @mes).where(:anio => @año).sum(:importe)
		@total     = (@facturado / @catalogo.to_i) * 100
		if @total.to_i > 100
			render json:  100
		else
			render json:  @total.to_i
		end
		
	end
end