class HousesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_house, only: %i[ show edit update destroy ]

  # GET /houses or /houses.json
  def index
    base = House
    if (params[:citta] != nil && params[:nazione] != nil)
      if (params[:citta] != "" && params[:nazione] != "")
        na = params[:nazione]
        ci = params[:citta]
        base = base.where("citta = :citta AND nazione = :nazione", { citta: ci, nazione: na })
      elsif (params[:citta] != "" && params[:nazione] == "")
        ci = params[:citta]
        base = base.where("citta = :citta ", { citta: ci })
      elsif (params[:citta] == "" && params[:nazione] != "")
        na = params[:nazione]
        base = base.where("nazione = :nazione", { nazione: na })
      end
    end
    if (params[:user_id] != nil)
      u = params[:user_id]
      base = base.where("user_id = :user", {user: u})
    end

    @houses = base.all
  end

  # GET /houses/1 or /houses/1.json
  def show
  end

  # GET /houses/new
  def new
    @house = House.new(user_id: current_user.id)
  end
  

  # GET /houses/1/edit
  def edit
  end

  # POST /houses or /houses.json
  def create
    @house = House.new(house_params)

    respond_to do |format|
      if @house.save
        format.html { redirect_to house_url(@house), notice: "House was successfully created." }
        format.json { render :show, status: :created, location: @house }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @house.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /houses/1 or /houses/1.json
  def update
    respond_to do |format|
      if @house.update(house_params)
        format.html { redirect_to house_url(@house), notice: "House was successfully updated." }
        format.json { render :show, status: :ok, location: @house }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @house.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /houses/1 or /houses/1.json
  def destroy
    @house.destroy

    respond_to do |format|
      format.html { redirect_to houses_url, notice: "House was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_house
    @house = House.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def house_params
    params.require(:house).permit(:user_id, :tipologia, :superficie, :n_bagni, :n_camere, :n_cucine, :n_soggiorni, :n_singoli, :n_doppi, :n_culle, :n_divani, :allergie, :animali, :desc_casa, :desc_quartiere, :data_in, :data_out, :place_id, :citta, :nazione, provides_attributes: [:service_id], photos: [])
  end
end
