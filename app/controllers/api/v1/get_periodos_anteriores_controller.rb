class Api::V1::GetPeriodosAnterioresController <ApplicationController
	include ActionView::Helpers::NumberHelper
	def index
   		@año = Date.today.year
		@parametro = params[:app_id]		
		meses = Facturada.select(:mes).uniq.order('mes asc')
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
				else
				@cumplio = "Cumplio con el objetivo"
			end
				@total = (@catalogo / @objetivo.to_i ) * 100 

			{
				:mes => mes(k.mes),
				:venta => number_to_currency(@catalogo),
				:objetivo => number_to_currency(@objetivo),
				:estatus => @cumplio,
				:porcentaje => @total.round(2)

			}

		end
		render json: elementos
	end	

private

 def mes(value)
    if value == "01"
        mes ="Enero"
    elsif value == "02" then mes = "Febrero"
    elsif value == "03" then mes = "Marzo"
    elsif value == "04" then mes = "Abril"
    elsif value == "05" then mes = "Mayo"
    elsif value == "06" then mes = "Junio"
    elsif value == "07" then mes = "Julio"
    elsif value == "08" then mes = "Agosto"
    elsif value == "09" then mes = "Septiembre"
    elsif value == "10" then mes = "Octubre"
    elsif value == "11" then mes = "Noviembre"
    elsif value == "12" then mes = "Diciembre"
    end
    return mes
  end

end