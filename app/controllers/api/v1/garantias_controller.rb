class Api::V1::GarantiasController <ApplicationController
    include ActionView::Helpers::NumberHelper
 def index
    @configuracion = Configuracion.where(:app_id => params[:app_id]).pluck(:dias_garantias).first
    @tipo = Configuracion.where(:app_id => params[:app_id]).pluck(:garantias).first
    if @configuracion.blank?
       render json: {:message => "Falta configurar las garantias"} 
   
    else
        
         @garantias = Pendiente.where(:app_id => params[:app_id]).where(:tipo => @tipo).order(fecha: :asc)
  
    elementos = @garantias.map do |k|
        @dias = distance_of_time_in_days(k.fecha)
        @porcentaje = (@dias.to_d / @configuracion.to_i).round(2) * 100
         if @dias > @configuracion.to_i
            {
                :orden => k.orden,
                :tipo => k.tipo,
                :fecha => k.fecha,
                :importe => number_to_currency(k.importe),
                :dias => @dias,
                :porcentaje => @porcentaje,
                :estatus => 2
                
            }
      
        else
        if @dias.between?(8,@configuracion.to_i)
            {
                :orden => k.orden,
                :tipo => k.tipo,
                :fecha => k.fecha,
                :importe => number_to_currency(k.importe),
                :dias => @dias,
                :porcentaje => @porcentaje,
                :estatus => 1
                
            }
        else
            if @dias.between?(1,7)
            {
                :orden => k.orden,
                :tipo => k.tipo,
                :fecha => k.fecha,
                :importe => number_to_currency(k.importe),
                :dias => @dias,
                :porcentaje => @porcentaje,
                :estatus => 0
                
            }
            end
      
        end
        end
        end
        render json: elementos
    end 
    
   
 end

 private
  def distance_of_time_in_days(from_time, to_time = Date.today, include_seconds = false)
    from_time = from_time.to_time if from_time.respond_to?(:to_time)
    to_time = to_time.to_time if to_time.respond_to?(:to_time)
    distance_in_days = (((to_time - from_time).abs)/86400).round
    return distance_in_days
  end
end