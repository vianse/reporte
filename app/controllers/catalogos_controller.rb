class CatalogosController < ApplicationController
  before_action :set_catalogo, only: [:show, :edit, :update, :destroy]

  # GET /catalogos
  # GET /catalogos.json
  def index
@parametro = params[:app_id]
@tipo = params[:type]
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
                        @catalogos = Catalogo.where(:app_id => @parametro) 
                      end
                end

        else
           @catalogos = Catalogo.where(:app_id => @parametro) 
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
               @catalogos = Catalogo.where(:app_id => @parametro)  
            end
          end

      else
        @catalogos = Catalogo.where(:app_id => @parametro) 
      end
    end

end

    # @parametro = params[:app_id]
    # @app    = App.where(:api_key => @parametro).pluck(:api_key).first
    # @acceso = Acceso.where(:user_id => current_user.id).where(:app_id => @parametro).pluck(:app_id).first
    # if @app.blank?
    #   redirect_to "/errors/app_id"
    # else
    #   if @acceso.blank?
    #     redirect_to "/errors/acceso"
    #   else
    #   @catalogos = Catalogo.where(:app_id => @acceso)
    #   end
    # end
  end

  # GET /catalogos/1
  # GET /catalogos/1.json
  def show
  end

  # GET /catalogos/new
  def new
    @parametro = params[:app_id]
    @tipo = params[:type]
    @group_id = App.where(:api_key => @parametro).pluck(:group_id).first
    #@app = App.select("api_key").where(:api_key => @acceso).first
    @catalogo = Catalogo.new
  end

  # GET /catalogos/1/edit
  def edit
  end

  # POST /catalogos
  # POST /catalogos.json
  def create
    @parametro = params[:app_id]
    @tipo = params[:type]
   @group_id = App.where(:api_key => @parametro).pluck(:group_id).first
    @catalogo = Catalogo.new(catalogo_params)
      if @catalogo.save
        redirect_to "/objetivos?app_id="+ @catalogo.app_id + "&type=" + @catalogo.tipo
      end
  end

  # PATCH/PUT /catalogos/1
  # PATCH/PUT /catalogos/1.json
  def update
 
      if @catalogo.update(catalogo_params)
        redirect_to "/objetivos?app_id="+ @catalogo.app_id + "&type=" + @catalogo.tipo
      end
  end

  # DELETE /catalogos/1
  # DELETE /catalogos/1.json
  def destroy
    @catalogo.destroy
    respond_to do |format|
      format.html { redirect_to catalogos_url, notice: 'Catalogo was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_catalogo
      @catalogo = Catalogo.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def catalogo_params
      params.require(:catalogo).permit(:mes, :año, :objetivo_real, :objetivo_obligado, :app_id, :user_id,:group_id,:tipo)
    end
end
