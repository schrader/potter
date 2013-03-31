class PotsController < ApplicationController
  before_action :set_pot, only: [:show, :edit, :update, :destroy]

  # GET /pots
  # GET /pots.json
  def index
    @pots = current_user.pots
  end

  # GET /pots/1
  # GET /pots/1.json
  def show
    @link = Link.new(pot: @pot)#@pot.links.build
  end

  # GET /pots/new
  def new
    @pot = Pot.new
  end

  # GET /pots/1/edit
  def edit
  end

  # POST /pots
  # POST /pots.json
  def create
    @pot = Pot.new(pot_params)
    @pot.users << current_user
    respond_to do |format|
      if @pot.save
        @pot.create_activity :create, owner: current_user
        format.html { redirect_to @pot, notice: 'Pott wurde erstellt.' }
        format.json { render action: 'show', status: :created, location: @pot }
      else
        format.html { render action: 'new' }
        format.json { render json: @pot.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /pots/1
  # PATCH/PUT /pots/1.json
  def update
    respond_to do |format|
      if @pot.update(pot_params)
        @pot.create_activity :update, owner: current_user
        format.html { redirect_to @pot, notice: 'Pott wurde aktualisiert.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @pot.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /pots/1
  # DELETE /pots/1.json
  def destroy
    @pot.destroy
    respond_to do |format|
      format.html { redirect_to pots_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_pot
      @pot = current_user.pots.find(params[:id]).decorate
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def pot_params
      params.require(:pot).permit(:name, :delivery_day, :delivery_hour)
    end
end
