class Api::V1::GetFechaController <ApplicationController
 skip_before_filter :verify_authenticity_token
	def index
        @mes = Date.today.month
        @dia = Date.today.day
	   render json: { 
        :dia => @dia.to_s + " de ",
        :mes => mes(@mes.to_s),
        :año => Date.today.year
       }
 end
 private
 def mes(value)
    if value == "01"
        mes ="Enero"
    elsif value == "02" then mes = "Febrero del "
    elsif value == "03" then mes = "Marzo del "
    elsif value == "04" then mes = "Abril del "
    elsif value == "05" then mes = "Mayo del "
    elsif value == "06" then mes = "Junio del "
    elsif value == "07" then mes = "Julio del "
    elsif value == "08" then mes = "Agosto del "
    elsif value == "09" then mes = "Septiembre del "
    elsif value == "10" then mes = "Octubre del "
    elsif value == "11" then mes = "Noviembre del "
    elsif value == "12" then mes = "Diciembre del "
    end
    return mes
    end
end