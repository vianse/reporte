class FacturadasController < ApplicationController
  before_action :set_facturada, only: [:show, :edit, :update, :destroy]

  # GET /facturadas
  # GET /facturadas.json
  def index
    @facturadas = Facturada.all
  end

  # GET /facturadas/1
  # GET /facturadas/1.json
  def show
  end

  # GET /facturadas/new
  def new
    @facturada = Facturada.new
  end

  # GET /facturadas/1/edit
  def edit
  end

  # POST /facturadas
  # POST /facturadas.json
  def create
    @facturada = Facturada.new(facturada_params)

    respond_to do |format|
      if @facturada.save
        format.html { redirect_to @facturada, notice: 'Facturada was successfully created.' }
        format.json { render :show, status: :created, location: @facturada }
      else
        format.html { render :new }
        format.json { render json: @facturada.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /facturadas/1
  # PATCH/PUT /facturadas/1.json
  def update
    respond_to do |format|
      if @facturada.update(facturada_params)
        format.html { redirect_to @facturada, notice: 'Facturada was successfully updated.' }
        format.json { render :show, status: :ok, location: @facturada }
      else
        format.html { render :edit }
        format.json { render json: @facturada.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /facturadas/1
  # DELETE /facturadas/1.json
  def destroy
    @facturada.destroy
    respond_to do |format|
      format.html { redirect_to facturadas_url, notice: 'Facturada was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_facturada
      @facturada = Facturada.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def facturada_params
      params.require(:facturada).permit(:orden, :tipo, :importe, :fecha, :estatus, :app_id, :factura)
    end
end
