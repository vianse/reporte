class Api::V1::RandomOrdenController <ApplicationController
	include ActionView::Helpers::NumberHelper
	def index
		@mes = Date.today.month
		@año = Date.today.year
		@app = App.select("api_key").where(:user_id => current_user.id)
		@acceso = Acceso.select("app_id").where(:user_id => current_user.id)
		@configuracion = Configuracion.where(:app_id => @acceso).pluck(:dias).first
		@fecha = Date.today() - @configuracion.to_i #Fecha con la resta del parametro
		@catalogo = Catalogo.where(:mes => @mes).where(:app_id => @acceso).pluck(:objetivo_obligado).first
		@facturado = Facturada.where(:app_id => @acceso).where(:mes => @mes).where(:anio => @año).sum(:importe)
		@total_facturado = @facturado
		@conteo = Pendiente.where(:app_id => @acceso).where("fecha < ?", @fecha).count(:id)
		if @conteo > 6
		@random = rand(1..9)
		else
		@random = rand(1..@conteo)
		end
		@total = @conteo - @random 
		@porcentaje = ((( @total.to_d / @conteo.to_d) * 100) - 100) * -1
		@sum = Pendiente.select("importe").where(:app_id => @acceso).sum(:importe)
		@ordenes = Pendiente.select("orden","importe").where(:app_id => @acceso).where("fecha < ?", @fecha).order("RANDOM()").limit(@random)
		@moneda = @ordenes.map {|s| s['importe']}.reduce(0, :+)

		@total_pronostico = @total_facturado + @moneda
		@porcentaje_venta = (@total_pronostico / @catalogo) * 100

		@resta = @sum - @moneda
			elementos = @ordenes.map do |k|
			{	
			:ordenes => k.orden,
			:total => number_to_currency(@moneda),
			:totalordenes => @total,
			:resta => number_to_currency(@resta),
			:porcentaje => @porcentaje.to_i,
			:importe_facturado => number_to_currency(@catalogo),
			:importe_venta => number_to_currency(@total_pronostico),
			:porcentaje_venta => @porcentaje_venta.to_i,
			:dias => @configuracion,
			:fecha => @fecha,
			:contador => @conteo
			}
			end
			render json: elementos
	end
end