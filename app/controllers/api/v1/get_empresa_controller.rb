class Api::V1::GetEmpresaController <ApplicationController
	def index
		@parametro = params[:app_id]
		if params[:type] == "Servicio"
		@app    = App.where(:api_key => @parametro).pluck(:group).first
		@acceso = Acceso.where(:user_id => current_user.id).where(:group_id => @app).pluck(:group_id).first
		if @app.blank?
			render json: {
				message: "El App Id no existe, favor de intentar nuevamente."
			}
		else
			if @acceso.blank?
					@app    = App.where(:api_key => @parametro).pluck(:api_key).first
					@acceso = Acceso.where(:user_id => current_user.id).where(:app_id_s => @parametro).pluck(:app_id_s).first
					if @app.blank?
						render json: {
							message: "El App Id no existe, favor de intentar nuevamente."
						}
					else
						if @acceso.blank?
							render json: {
								:name => "Sin Acceso"
							}
						else

						   @empresa = App.select("name").where(:api_key => @acceso).first
						   render json: {
								:name => @empresa.name
							}
						end
					end

			else
			   @empresa = App.select("name").where(:api_key => @parametro).first
			   render json: {
					:name => @empresa.name
				}
			end
		end

	  end

		if params[:type] == "HYP"
		@app    = App.where(:api_key => @parametro).pluck(:group).first
		@acceso = Acceso.where(:user_id => current_user.id).where(:group_id => @app).pluck(:group_id).first
		if @app.blank?
			render json: {
				message: "El App Id no existe, favor de intentar nuevamente."
			}
		else
			if @acceso.blank?
					@app    = App.where(:api_key => @parametro).pluck(:api_key).first
					@acceso = Acceso.where(:user_id => current_user.id).where(:app_id_h => @parametro).pluck(:app_id_h).first
					if @app.blank?
						render json: {
							message: "El App Id no existe, favor de intentar nuevamente."
						}
					else
						if @acceso.blank?
							render json: {
								:name => "Sin Acceso"
							}
						else

						   @empresa = App.select("name").where(:api_key => @acceso).first
						   render json: {
								:name => @empresa.name
							}
						end
					end

			else
			   @empresa = App.select("name").where(:api_key => @parametro).first
			   render json: {
					:name => @empresa.name
				}
			end
		end

	  end
	end
end