class ConfiguracionsController < ApplicationController
  before_action :set_configuracion, only: [:show, :edit, :update, :destroy]

  # GET /configuracions
  # GET /configuracions.json
  def index

@tipo = params[:type]
@parametro = params[:app_id]
if params[:type] == "Servicio"
    @app    = App.where(:api_key => @parametro).pluck(:group_id).first
    @acceso = Acceso.where(:user_id => current_user.id).where(:group_id => @app).pluck(:group_id).first
    if @app.blank?
      redirect_to "/errors/app_id"
    else
        if @acceso.blank?
            @app    = App.where(:api_key => @parametro).pluck(:api_key).first
            @acceso = Acceso.where(:user_id => current_user.id).where(:app_id_s => @parametro).pluck(:app_id_s).first
                if @app.blank?
                  redirect_to "/errors/app_id"
                else
                      if @acceso.blank?
                        redirect_to "/errors/acceso"
                      else
                        @configuracions = Configuracion.where(:app_id => @acceso) 
                      end
                end

        else
           @configuracions = Configuracion.where(:app_id => @parametro) 
        end
    end

end

    if params[:type] == "HYP"
    @app    = App.where(:api_key => @parametro).pluck(:group_id).first
    @acceso = Acceso.where(:user_id => current_user.id).where(:group_id => @app).pluck(:group_id).first
    if @app.blank?
      redirect_to "/errors/app_id"
    else
      if @acceso.blank?
          @app    = App.where(:api_key => @parametro).pluck(:api_key).first
          @acceso = Acceso.where(:user_id => current_user.id).where(:app_id_h => @parametro).pluck(:app_id_h).first
          if @app.blank?
            redirect_to "/errors/app_id"
          else
            if @acceso.blank?
              redirect_to "/errors/acceso"
            else
               @configuracions = Configuracion.where(:app_id => @acceso) 
            end
          end

      else
         @configuracions = Configuracion.where(:app_id => @acceso) 
      end
    end

end



    # @acceso = Acceso.select("app_id").where(:user_id => current_user.id).first
    # if @acceso.nil?
    #   render json: {
    #       :codigo_error =>  "1000",
    #       :message => "No tienes acceso, verifica con el departamento de sistemas"
    #     } 
    # else
    #   @acceso = Acceso.where(:user_id => current_user.id).pluck(:app_id).first
    #   @app = App.select("api_key").where(:api_key => @acceso).first
    #   @configuracions = Configuracion.where(:app_id => @acceso)   
    #  end
  end

  # GET /configuracions/1
  # GET /configuracions/1.json
  def show
  end

  # GET /configuracions/new
  def new
    @configuracion = Configuracion.new
    @group_id = Acceso.where(:user_id => current_user.id).pluck(:group_id).first
    #@acceso = Acceso.select("app_id").where(:user_id => current_user.id).first
    @acceso = params[:app_id]
    @tipo = params[:type]
  end

  # GET /configuracions/1/edit
  def edit
  end

  # POST /configuracions
  # POST /configuracions.json
  def create
    @configuracion = Configuracion.new(configuracion_params)

   
      if @configuracion.save
       #redirect_to "/settings?app_id="+ @configuracion.app_id + "&type=" + @configuracion.tipo
        redirect_to "/"
      end
  end

  # PATCH/PUT /configuracions/1
  # PATCH/PUT /configuracions/1.json
  def update
      if @configuracion.update(configuracion_params)
        #redirect_to "/settings?app_id="+ @configuracion.app_id + "&type=" + @configuracion.tipo
        redirect_to "/"
      end
   
  end

  # DELETE /configuracions/1
  # DELETE /configuracions/1.json
  def destroy
    @configuracion.destroy
    respond_to do |format|
      format.html { redirect_to configuracions_url, notice: 'Configuracion was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_configuracion
      @configuracion = Configuracion.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def configuracion_params
      params.require(:configuracion).permit(:internas, :publicas,:dias, :garantias, :dias_garantias, :app_id, :group_id,:tipo)
    end
end
