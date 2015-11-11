class PendientesController < ApplicationController
  before_action :set_pendiente, only: [:show, :edit, :update, :destroy]

  # GET /pendientes
  # GET /pendientes.json


  def index
    @pendientes = Pendiente.all
  end

  # GET /pendientes/1
  # GET /pendientes/1.json
  def show
  end

  # GET /pendientes/new
  def new
    @pendiente = Pendiente.new
  end

  # GET /pendientes/1/edit
  def edit
  end

  # POST /pendientes
  # POST /pendientes.json
  def create
    @pendiente = Pendiente.new(pendiente_params)

    respond_to do |format|
      if @pendiente.save
        format.html { redirect_to @pendiente, notice: 'Pendiente was successfully created.' }
        format.json { render :show, status: :created, location: @pendiente }
      else
        format.html { render :new }
        format.json { render json: @pendiente.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /pendientes/1
  # PATCH/PUT /pendientes/1.json
  def update
    respond_to do |format|
      if @pendiente.update(pendiente_params)
        format.html { redirect_to @pendiente, notice: 'Pendiente was successfully updated.' }
        format.json { render :show, status: :ok, location: @pendiente }
      else
        format.html { render :edit }
        format.json { render json: @pendiente.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /pendientes/1
  # DELETE /pendientes/1.json
  def destroy
    @pendiente.destroy
    respond_to do |format|
      format.html { redirect_to pendientes_url, notice: 'Pendiente was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_pendiente
      @pendiente = Pendiente.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def pendiente_params
      params.require(:pendiente).permit(:orden, :tipo, :importe, :fecha, :estatus, :app_id)
    end
end
