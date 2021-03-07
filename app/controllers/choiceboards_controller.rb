class ChoiceboardsController < ApplicationController
  before_action :set_choiceboard, only: %i[ show edit update destroy ]

  # GET /choiceboards or /choiceboards.json
  def index
    @choiceboards = Choiceboard.all
  end

  # GET /choiceboards/1 or /choiceboards/1.json
  def show
  end

  # GET /choiceboards/new
  def new
    @choiceboard = Choiceboard.new
  end

  # GET /choiceboards/1/edit
  def edit
  end

  # POST /choiceboards or /choiceboards.json
  def create
    @choiceboard = Choiceboard.new(choiceboard_params)

    respond_to do |format|
      if @choiceboard.save
        format.html { redirect_to @choiceboard, notice: "Choiceboard was successfully created." }
        format.json { render :show, status: :created, location: @choiceboard }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @choiceboard.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /choiceboards/1 or /choiceboards/1.json
  def update
    respond_to do |format|
      if @choiceboard.update(choiceboard_params)
        format.html { redirect_to @choiceboard, notice: "Choiceboard was successfully updated." }
        format.json { render :show, status: :ok, location: @choiceboard }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @choiceboard.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /choiceboards/1 or /choiceboards/1.json
  def destroy
    @choiceboard.destroy
    respond_to do |format|
      format.html { redirect_to choiceboards_url, notice: "Choiceboard was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_choiceboard
      @choiceboard = Choiceboard.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def choiceboard_params
      params.require(:choiceboard).permit(:user_id_id, :name, :image_uid, :sound_uid)
    end
end
