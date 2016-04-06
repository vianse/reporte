class Api::V1::EncuestaController <ApplicationController
	include ActionView::Helpers::NumberHelper
	def index
	   #telefonos = ["+5215548225097","+5215548225088","+5214423389783","+5215543884061"]
	   telefonos = ["+5215548225097"]
     #telefonos = ["+5215531328421"]
       telefonos.map do |t|
        #logger.debug t
        #phone_number = t
        #logger.debug t
        SinchSms.send('1689b905-8427-4d27-88cb-20b6f3e7d746', '2+dPC6wLU0Ko7RPTeVT85w==', "Responde nuestra encuesta ingresado a pronostic.com.mx/encuesta", t)
      end
      render json: {:message => "Encuesta enviada correctamente"}
	end
end
