class Api::V1::GarantiasEstatusColorController <ApplicationController
    include ActionView::Helpers::NumberHelper
    
    def index
        @mes = Date.today.month
        @año = Date.today.year
        @configuracion = Configuracion.where(:app_id => params[:app_id]).pluck(:dias_garantias).first
        @garantias = Garantium.where.not(:fecha_salida => nil).where(:mes => @mes).where(:año => @año).where(:app_id => params[:app_id])
        #logger.debug @garantias.to_a
        #logger.debug json(@garantias)
        valor = json(@garantias)
        elementos = @garantias.map do |k|
            
            dias = distance_of_time_in_days(k.fecha, k.fecha_salida)
            @dias_totales = valor.inject(0, :+)
            @conteo = valor.size
            @promedio = (@dias_totales.to_f / @conteo ).round(2) 
            @divicion = @promedio / @configuracion.to_i  * 100
             #@divicion = 68
            #logger.debug @dias_totales
            #logger.debug @divicion.round(0)
            if @divicion.round(0) > 66
                {
                #:orden => k.orden,
               
                :color => 2
                
                }
            else
            if @divicion.round(0).between?(0,33)
                {
                #:orden => k.orden,
                #:dias => dias,
                
                :color => 0
              
                }
            else
            if @divicion.round(0).between?(34,66)
                {
                #:orden => k.orden,
                #:dias => dias,
                
                :color => 1
              
                }
            end
           end
          end
        end
        render :json => elementos[0]
        

    end
    private
  def distance_of_time_in_days(from_time, to_time, include_seconds = false)
    from_time = from_time.to_time if from_time.respond_to?(:to_time)
    to_time = to_time.to_time if to_time.respond_to?(:to_time)
    distance_in_days = (((to_time - from_time).abs)/86400).round
    return distance_in_days
  end

def json(value)
      elementos = value.map do |k|
        dias = distance_of_time_in_days(k.fecha, k.fecha_salida)
      end
      elementos
    end

end