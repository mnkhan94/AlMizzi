class NarrationsController < ApplicationController
  before_action :set_narration, only: [:show, :edit, :update, :destroy]

  # GET /narrations
  # GET /narrations.json
  def index
    @narrations = Narration.all
  end

  # GET /narrations/1
  # GET /narrations/1.json
  def show
  end

  # GET /narrations/new
  def new
    @narration = Narration.new
  end

  # GET /narrations/1/edit
  def edit
  end

  def reset_narration
    n = Narration.find(params[:id])
    n.reset_narration
  end

  # POST /narrations
  # POST /narrations.json
  def create
    @narration = Narration.new(narration_params)

    respond_to do |format|
      if @narration.save
        format.html { redirect_to @narration, notice: 'Narration was successfully created.' }
        format.json { render :show, status: :created, location: @narration }
      else
        format.html { render :new }
        format.json { render json: @narration.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /narrations/1
  # PATCH/PUT /narrations/1.json
  def update
    respond_to do |format|
      if @narration.update(narration_params)
        format.html { redirect_to @narration, notice: 'Narration was successfully updated.' }
        format.json { render :show, status: :ok, location: @narration }
      else
        format.html { render :edit }
        format.json { render json: @narration.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /narrations/1
  # DELETE /narrations/1.json
  def destroy
    @narration.destroy
    respond_to do |format|
      format.html { redirect_to narrations_url, notice: 'Narration was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_narration
      @narration = Narration.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def narration_params
      params.require(:narration).permit!
    end
end
