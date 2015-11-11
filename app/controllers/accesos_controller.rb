class AccesosController < ApplicationController
  before_action :set_acceso, only: [:show, :edit, :update, :destroy]

  # GET /accesos
  # GET /accesos.json
  def index
    @accesos = Acceso.all
  end

  # GET /accesos/1
  # GET /accesos/1.json
  def show
  end

  # GET /accesos/new
  def new
    @acceso = Acceso.new
  end

  # GET /accesos/1/edit
  def edit
  end

  # POST /accesos
  # POST /accesos.json
  def create
    @acceso = Acceso.new(acceso_params)

    respond_to do |format|
      if @acceso.save
        format.html { redirect_to @acceso, notice: 'Acceso was successfully created.' }
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
      params.require(:acceso).permit(:user_id, :app_id)
    end
end
