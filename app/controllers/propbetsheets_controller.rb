class PropbetsheetsController < ApplicationController
  before_action :set_propbetsheet, only: [:show, :edit, :update, :destroy]

  # GET /propbetsheets
  # GET /propbetsheets.json
  def index
    @propbetsheets = Propbetsheet.all
  end

  # GET /propbetsheets/1
  # GET /propbetsheets/1.json
  def show
  end

  # GET /propbetsheets/new
  def new
    @propbetsheet = Propbetsheet.new
  end

  # GET /propbetsheets/1/edit
  def edit
  end

  # POST /propbetsheets
  # POST /propbetsheets.json
  def create
    @propbetsheet = Propbetsheet.new(propbetsheet_params)

    respond_to do |format|
      if @propbetsheet.save
        format.html { redirect_to @propbetsheet, notice: 'Propbetsheet was successfully created.' }
        format.json { render :show, status: :created, location: @propbetsheet }
      else
        format.html { render :new }
        format.json { render json: @propbetsheet.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /propbetsheets/1
  # PATCH/PUT /propbetsheets/1.json
  def update
    respond_to do |format|
      if @propbetsheet.update(propbetsheet_params)
        format.html { redirect_to @propbetsheet, notice: 'Propbetsheet was successfully updated.' }
        format.json { render :show, status: :ok, location: @propbetsheet }
      else
        format.html { render :edit }
        format.json { render json: @propbetsheet.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /propbetsheets/1
  # DELETE /propbetsheets/1.json
  def destroy
    @propbetsheet.destroy
    respond_to do |format|
      format.html { redirect_to propbetsheets_url, notice: 'Propbetsheet was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_propbetsheet
      @propbetsheet = Propbetsheet.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def propbetsheet_params
      params.require(:propbetsheet).permit(:name, :paid, :total_points)
    end
end
