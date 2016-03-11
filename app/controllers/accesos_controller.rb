class AccesosController < ApplicationController
  before_action :set_acceso, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_sistema! , :except => [:index]
  # GET /accesos
  # GET /accesos.json
  def index
  
    @accesos   = Acceso.where(:usuario => current_sistema.id)
    grupo      = Appadmin.where(:admin_id => current_sistema.id).pluck(:group_id)
    servicio   = Appadmin.where(:admin_id => current_sistema.id).pluck(:app_id)
    @acceso_gg = Acceso.where(:group_id => grupo).where.not(:group_id => nil).count
    @acceso_gp = Acceso.where(:app_id_s => params[:app_id]).where.not(:app_id_s => nil).count
    @acceso_hyp = Acceso.where(:app_id_h => params[:app_id]).where.not(:app_id_h => nil).count
    @acceso_as = Acceso.where(:asesor => params[:app_id]).where.not(:asesor => nil).count
    @acceso_ga = Acceso.where(:garantias => params[:app_id]).where.not(:garantias => nil).count
    @tipo = App.where(:api_key => servicio).pluck(:type_app).first
    
  end

  def perfiles
    grupo    = Appadmin.where(:admin_id => current_sistema.id).pluck(:group_id)
    servicio = Appadmin.where(:admin_id => current_sistema.id).pluck(:app_id)
    if params[:perfil] == "gg"
    @accesos = Acceso.where(:group_id => grupo).where.not(:group_id => nil)
    @acceso  = Acceso.where(:group_id => grupo).count
    end
    if params[:perfil] == "gp"
    @accesos = Acceso.where(:app_id_s => params[:app_id]).where.not(:app_id_s => nil)
    @acceso = Acceso.where(:app_id_s => params[:app_id]).count
    end
    if params[:perfil] == "hyp"
    @accesos = Acceso.where(:app_id_h => params[:app_id]).where.not(:app_id_h => nil)
    @acceso  = Acceso.where(:app_id_h => params[:app_id]).count
    end
    if params[:perfil] == "as"
    @accesos = Acceso.where(:asesor => params[:app_id]).where.not(:asesor => nil)
    @acceso  = Acceso.where(:asesor => params[:app_id]).count
    end
    if params[:perfil] == "ga"
    @accesos = Acceso.where(:garantias => params[:app_id]).where.not(:garantias => nil)
    @acceso  = Acceso.where(:garantias=> params[:app_id]).count
    end
  end

  # GET /accesos/1
  # GET /accesos/1.json
  def show
  end

  # GET /accesos/new
  def new
    @user = User.where(:group_id => params[:group_id])
    @group = Group.where(:user_id => current_sistema.id)
    @servicio = App.where(:user_id => current_sistema.id).where(:type_app => "Servicio")
    @hyp = App.where(:user_id => current_sistema.id).where(:type_app => "HYP")
    @acceso = Acceso.new
  end
  def nuevo_perfil

    @user = User.where(:group_id => params[:group_id]).where(:app_id => params[:app_id])
    resul = Appadmin.where(:admin_id => current_sistema.id).pluck(:group_id)
    @group = Group.where(:group_id => resul)
    @servicio = App.where(:user_id => current_sistema.id).where(:type_app => "Servicio")
    @hyp = App.where(:user_id => current_sistema.id).where(:type_app => "HYP")
    @acceso = Acceso.new
  end
  def nuevo_perfil_postventa
    grupo    = Appadmin.where(:admin_id => current_sistema.id).pluck(:group_id)
    servicio = Appadmin.where(:admin_id => current_sistema.id).pluck(:app_id)
    @user = User.where(:group_id => params[:group_id]).where(:app_id => params[:app_id])
    @group = Group.where(:user_id => current_sistema.id)
    @servicio = App.where(:api_key => servicio).where(:type_app => "Servicio")
    @hyp      = App.where(:api_key => servicio).where(:type_app => "HYP")
    @acceso   = Acceso.new
  end
  def nuevo_perfil_hyp
    grupo    = Appadmin.where(:admin_id => current_sistema.id).pluck(:group_id)
    servicio = Appadmin.where(:admin_id => current_sistema.id).pluck(:app_id)
    @user = User.where(:group_id => params[:group_id]).where(:app_id => params[:app_id])
    @group = Group.where(:user_id => current_sistema.id)
    @servicio = App.where(:user_id => current_sistema.id).where(:type_app => "Servicio")
    @hyp    = App.where(:api_key => servicio).where(:type_app => "HYP")
    @acceso = Acceso.new
  end
  def nuevo_perfil_asesores
    grupo    = Appadmin.where(:admin_id => current_sistema.id).pluck(:group_id)
    servicio = Appadmin.where(:admin_id => current_sistema.id).pluck(:app_id)
    @user = User.where(:group_id => params[:group_id]).where(:app_id => params[:app_id])
    @group = Group.where(:user_id => current_sistema.id)
    @servicio = App.where(:api_key => servicio).where(:type_app => "Servicio")
    @hyp = App.where(:user_id => current_sistema.id).where(:type_app => "HYP")
    @acceso = Acceso.new
  end
  def nuevo_perfil_garantias
    grupo    = Appadmin.where(:admin_id => current_sistema.id).pluck(:group_id)
    servicio = Appadmin.where(:admin_id => current_sistema.id).pluck(:app_id)
    @user = User.where(:group_id => params[:group_id]).where(:app_id => params[:app_id])
    @group = Group.where(:user_id => current_sistema.id)
    @servicio = App.where(:api_key => servicio).where(:type_app => "Servicio")
    @hyp = App.where(:user_id => current_sistema.id).where(:type_app => "HYP")
    @acceso = Acceso.new
  end

  # GET /accesos/1/edit
  def edit
  end

  # POST /accesos
  # POST /accesos.json
  def create
    @acceso = Acceso.new({
      :user_id => params[:usuario],
      :group_id=> params[:group_id],
      :app_id_s=> params[:servicio],
      :app_id_h=> params[:hyp],
      :asesor  => params[:asesor],
      :garantias  => params[:garantias],
      :usuario=> current_sistema.id
      })
    respond_to do |format|
      if @acceso.save
        format.html { redirect_to '/panel', notice: 'Acceso was successfully created.' }
        format.json { render :show, status: :created, location: @acceso }
      else
        format.html { render :new }
        format.json { render json: @acceso.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /accesos/1
  # PATCH/PUT /accesos/1.json
  def update
    respond_to do |format|
      if @acceso.update(acceso_params)
        format.html { redirect_to @acceso, notice: 'Acceso was successfully updated.' }
        format.json { render :show, status: :ok, location: @acceso }
      else
        format.html { render :edit }
        format.json { render json: @acceso.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /accesos/1
  # DELETE /accesos/1.json
  def destroy
    @acceso.destroy
    respond_to do |format|
      format.html { redirect_to accesos_url, notice: 'Acceso was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_acceso
      @acceso = Acceso.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def acceso_params
      params.require(:acceso).permit(:user_id, :group_id, :app_id_s, :app_id_h)
    end
end
