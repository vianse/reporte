class Api::V1::GetNombreAsesorController <ApplicationController
	def index
		@parametro = params[:app_id]
		@asesor = Asesor.where(:app_id => @parametro).where(:user_id => current_user.id).pluck(:nombre)
		render json: @asesor
	end	
end