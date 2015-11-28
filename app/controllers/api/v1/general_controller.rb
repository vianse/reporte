class Api::V1::GeneralController <ApplicationController
    include ActionView::Helpers::NumberHelper
 def index
    @parametro = params[:group_id]
    @mes = Date.today.month
    @año = Date.today.year
    @grupo_name = Group.where(:group_id => @parametro).pluck(:name).first
    @venta_servicio = Facturada.where(:group_id => @parametro).where(:mes => @mes).where(:anio => @año).where(:sucursal_tipo => "S").sum(:importe)
    @venta_hyp = Facturada.where(:group_id => @parametro).where(:mes => @mes).where(:anio => @año).where(:sucursal_tipo => "H").sum(:importe)
    @total = @venta_servicio + @venta_hyp

    @objetivo = Catalogo.where(:mes => @mes).where(:año => @año).where(:group_id => @parametro).sum(:objetivo_obligado)
    @venta_adicional = if @total >= @objetivo then @total - @objetivo else "0.00" end
    render json: {
        nombre: @grupo_name,
        facturacion_servicio: number_to_currency(@venta_servicio),
        facturacion_hyp: number_to_currency(@venta_hyp),
        venta_total: number_to_currency(@total),
        objetivo: number_to_currency(@objetivo),
        venta_adicional: number_to_currency(@venta_adicional),


    }
   
 end
end