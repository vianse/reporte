class Api::V1::GetFechaController <ApplicationController
 skip_before_filter :verify_authenticity_token
	def index
        @mes = Time.now.strftime("%m")
        @dia = Time.now.strftime("%d")
	   render json: { 
        :dia => @dia.to_s + " de ",
        :mes => mes(@mes.to_s),
        :año => Date.today.year
       }
 end
 private
 def mes(value)
    if value == "01" || value == "1"
        mes ="Enero del "
    elsif value == "02" || value == "2" then mes = "Febrero del "
    elsif value == "03" || value == "3" then mes = "Marzo del "
    elsif value == "04" || value == "4" then mes = "Abril del "
    elsif value == "05" || value == "5" then mes = "Mayo del "
    elsif value == "06" || value == "6" then mes = "Junio del "
    elsif value == "07" || value == "7" then mes = "Julio del "
    elsif value == "08" || value == "8" then mes = "Agosto del "
    elsif value == "09" || value == "8" then mes = "Septiembre del "
    elsif value == "10"  then mes = "Octubre del "
    elsif value == "11"  then mes = "Noviembre del "
    elsif value == "12"  then mes = "Diciembre del "
    end
    return mes
    end
end