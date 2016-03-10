class AppadminsController < ApplicationController
  before_action :set_appadmin, only: [:show, :edit, :update, :destroy]

  # GET /appadmins
  # GET /appadmins.json
  def index
    @appadmins = Appadmin.where(:group_id => params[:group_id]).where(:app_id => params[:app_id])
  end

  # GET /appadmins/1
  # GET /appadmins/1.json
  def show
  end

  # GET /appadmins/new
  def new
    @user = Sistema.where(:group_id => params[:group_id])
    @apps = App.where(:group_id => params[:group_id])
    @appadmin = Appadmin.new
  end

  # GET /appadmins/1/edit
  def edit
  end

  # POST /appadmins
  # POST /appadmins.json
  def create
    @acceso = Appadmin.new({
      :app_id => params[:app_id], 
      :group_id => params[:group_id],
      :admin_id => params[:admin_id]
      })
    respond_to do |format|
      if @acceso.save
        format.html { redirect_to '/administracion', notice: 'Acceso was successfully created.' }
        format.json { render :show, status: :created, location: @acceso }
      else
        format.html { render :new }
        format.json { render json: @acceso.errors, status: :unprocessable_entity }
      end
    end

  end

  # PATCH/PUT /appadmins/1
  # PATCH/PUT /appadmins/1.json
  def update
    respond_to do |format|
      if @appadmin.update(appadmin_params)
        format.html { redirect_to @appadmin, notice: 'Appadmin was successfully updated.' }
        format.json { render :show, status: :ok, location: @appadmin }
      else
        format.html { render :edit }
        format.json { render json: @appadmin.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /appadmins/1
  # DELETE /appadmins/1.json
  def destroy
    @appadmin.destroy
    respond_to do |format|
      format.html { redirect_to appadmins_url, notice: 'Appadmin was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_appadmin
      @appadmin = Appadmin.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def appadmin_params
      params.require(:appadmin).permit(:app_id, :group_id, :admin_id)
    end
end
