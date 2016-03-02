class GarantiaController < ApplicationController
  before_action :set_garantium, only: [:show, :edit, :update, :destroy]

  # GET /garantia
  # GET /garantia.json
  def index
    @garantia = Garantium.all
  end

  # GET /garantia/1
  # GET /garantia/1.json
  def show
  end

  # GET /garantia/new
  def new
    @garantium = Garantium.new
  end

  # GET /garantia/1/edit
  def edit
  end

  # POST /garantia
  # POST /garantia.json
  def create
    @garantium = Garantium.new(garantium_params)

    respond_to do |format|
      if @garantium.save
        format.html { redirect_to @garantium, notice: 'Garantium was successfully created.' }
        format.json { render :show, status: :created, location: @garantium }
      else
        format.html { render :new }
        format.json { render json: @garantium.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /garantia/1
  # PATCH/PUT /garantia/1.json
  def update
    respond_to do |format|
      if @garantium.update(garantium_params)
        format.html { redirect_to @garantium, notice: 'Garantium was successfully updated.' }
        format.json { render :show, status: :ok, location: @garantium }
      else
        format.html { render :edit }
        format.json { render json: @garantium.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /garantia/1
  # DELETE /garantia/1.json
  def destroy
    @garantium.destroy
    respond_to do |format|
      format.html { redirect_to garantia_url, notice: 'Garantium was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_garantium
      @garantium = Garantium.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def garantium_params
      params.require(:garantium).permit(:key, :date)
    end
end
