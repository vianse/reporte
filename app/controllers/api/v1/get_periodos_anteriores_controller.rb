class Api::V1::GetPeriodosAnterioresController <ApplicationController
	include ActionView::Helpers::NumberHelper
	def index
   		@año = Date.today.year
		@parametro = params[:app_id]		
		meses = Facturada.select(:mes).where(:anio => @año).uniq.order('mes asc')
		tipo = params[:type]

		elementos = meses.map do |k|

			if tipo == "Servicio"
			@catalogo = Facturada.where(:app_id => @parametro).where(:anio => @año).where(:mes => k.mes).where(:sucursal_tipo => "S").sum(:importe)
			else
			@catalogo = Facturada.where(:app_id => @parametro).where(:anio => @año).where(:mes => k.mes).where(:sucursal_tipo => "H").sum(:importe)
			end
			@objetivo = Catalogo.where(:mes => k.mes).where(:año => @año).where(:app_id => @parametro).where(:tipo => tipo).pluck(:objetivo_obligado).first 
			if @objetivo.to_i > @catalogo.to_i || @objetivo.to_i == 0 
				@cumplio = "No llego al objetivo"
				@estado = 0
				else
				@cumplio = "Cumplio con el objetivo"
				@estado = 1
			end
				@total = (@catalogo / @objetivo.to_i ) * 100 

			{
				:mes => mes(k.mes),
				:venta => number_to_currency(@catalogo),
				:objetivo => number_to_currency(@objetivo),
				:estatus => @cumplio,
				:porcentaje => @total.round(2),
				:estado_id => @estado 

			}

		end
		render json: elementos
	end	

private

 def mes(value)
    if value == "01" || value == "1"
        mes ="Enero"
    elsif value == "02" || value == "2" then mes = "Febrero"
    elsif value == "03" || value == "3" then mes = "Marzo"
    elsif value == "04" || value == "4" then mes = "Abril"
    elsif value == "05" || value == "5" then mes = "Mayo"
    elsif value == "06" || value == "6" then mes = "Junio"
    elsif value == "07" || value == "7" then mes = "Julio"
    elsif value == "08" || value == "8" then mes = "Agosto"
    elsif value == "09" || value == "9" then mes = "Septiembre"
    elsif value == "10" then mes = "Octubre"
    elsif value == "11" then mes = "Noviembre"
    elsif value == "12" then mes = "Diciembre"
    end
    return mes
  end

end