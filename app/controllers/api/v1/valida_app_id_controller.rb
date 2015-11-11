class Api::V1::ValidaAppIdController <ApplicationController
 skip_before_filter :verify_authenticity_token
	def index
		@validar = App.where(api_key: params[:app_id]).first
	if  @validar.blank?
     	 render json: {
     	 	message: "0"
     	 	}
     else
      render json: {
     	 	message: "1"
     	 	}
	end
 end
end