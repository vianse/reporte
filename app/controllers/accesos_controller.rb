class AccesosController < ApplicationController
  before_action :set_acceso, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_sistema! , :except => [:index]
  # GET /accesos
  # GET /accesos.json
  def index
    @accesos = Acceso.where(:usuario => current_sistema.id)
    @acceso = Acceso.where(:usuario => current_sistema.id).count
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
