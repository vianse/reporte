 class Api::V1::GetSucursalesGeneralController <ApplicationController
    include ActionView::Helpers::NumberHelper
 def index
 @parametro = params[:group_id]
 @mes = Date.today.month
 @año = Date.today.year
 @empresa  = App.select(:name, :api_key).where(:group => @parametro).where(:type_app => "Servicio")

               elementos = @empresa.map do |k|
                 @venta   = Facturada.where(:sucursal_id => k.api_key).where(:mes => @mes).where(:anio => @año).where(:sucursal_tipo => "S").sum(:importe)
                 @venta_hyp   = Facturada.where(:sucursal_id => k.api_key).where(:mes => @mes).where(:anio => @año).where(:sucursal_tipo => "H").sum(:importe)
                 @objetivo = Catalogo.where(:mes => @mes).where(:año => @año).where(:app_id => k.api_key).pluck(:objetivo_obligado).first
                 @venta_adicional = @venta - @objetivo
                 if @venta_adicional <= 0
                    @venta_adicional_real = "No ha llegado al objetivo obligado"
                 else
                    @venta_adicional_real = @venta_adicional
                 end
                 # @sumar  = Pendiente.where(:sucursal_id => k.api_key).pluck(:importe)
                 # @moneda = @ordenes.map {|s| s['importe']}.reduce(0, :+)
                 # @dias = distance_of_time_in_days(@fecha)
                    {   
                    :sucursal => k.name,
                    :venta => number_to_currency(@venta),
                    :venta_hyp => number_to_currency(@venta_hyp),
                    :app_id => k.api_key,
                    :objetivo => number_to_currency(@objetivo),
                    :venta_adicional => number_to_currency(@venta_adicional_real)
                   
         
                    }
                    end
                render json: elementos
    end
end