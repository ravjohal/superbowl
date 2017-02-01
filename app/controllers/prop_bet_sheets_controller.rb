class PropBetSheetsController < ApplicationController
  before_action :set_prop_bet_sheet, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!

  # GET /prop_bet_sheets
  # GET /prop_bet_sheets.json
  def index
    @prop_bet_sheets = PropBetSheet.where(:user_id => current_user.id)
  end

  def all_prop_bet_sheets
    @prop_bet_sheets = PropBetSheet.all
  end

  # GET /prop_bet_sheets/1
  # GET /prop_bet_sheets/1.json
  def show
    unless current_user.id == @prop_bet_sheet.user_id || current_user.role == 1
      redirect_to root_path, :alert => "Access denied."
    end
  end

  # GET /prop_bet_sheets/new
  def new
    @prop_bet_sheet = PropBetSheet.new
    @questions = Question.where(:super_bowl_id => @current_super_bowl_id)
    # @question_count = @quetions.count
    @questions.each do |question|
      @prop_bet_sheet.prop_bets.build(:question => question)
    end
    @prop_bets = @prop_bet_sheet.prop_bets

    @prop_bet_sheets = PropBetSheet.where(:user_id => current_user.id)

    if @prop_bet_sheets.count == 1
      redirect_to root_path, :alert => "Cannot create more than one."
    end
  end

  # GET /prop_bet_sheets/1/edit
  def edit
    @questions = Question.where(:super_bowl_id => @current_super_bowl_id)
    # @question_count = @quetions.count
    @prop_bets = @prop_bet_sheet.prop_bets.order(:id)
    unless current_user.id == @prop_bet_sheet.user_id
      redirect_to root_path, :alert => "Access denied."
    end
  end

  # POST /prop_bet_sheets
  # POST /prop_bet_sheets.json
  def create
    # prop_bet_array = nil
    # prop_bet_sheet_params[:prop_bets_attributes].each do |prop_bet|
    #   puts "prop bet > >>>>>> " + prop_bet[:question_attributes][:id]
    #   prop_bet = PropBet.new(:question_id => prop_bet[:question_attributes].id, :answer_id => prop_bet[:question_attributes].option_ids)
    #   prop_bet.save!
    #   prop_bet_array << prop_bet
    # end

    @prop_bet_sheet = PropBetSheet.new(prop_bet_sheet_params)
    @prop_bet_sheet.super_bowl = @super_bowl
    @prop_bet_sheet.user = current_user


    respond_to do |format|
      if @prop_bet_sheet.save
        format.html { redirect_to @prop_bet_sheet, notice: 'Prop bet sheet was successfully created.' }
        format.json { render :show, status: :created, location: @prop_bet_sheet }
      else
        format.html { render :new }
        format.json { render json: @prop_bet_sheet.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /prop_bet_sheets/1
  # PATCH/PUT /prop_bet_sheets/1.json
  def update
    respond_to do |format|
      if @prop_bet_sheet.update(prop_bet_sheet_params)
        format.html { redirect_to @prop_bet_sheet, notice: 'Prop bet sheet was successfully updated.' }
        format.json { render :show, status: :ok, location: @prop_bet_sheet }
      else
        format.html { render :edit }
        format.json { render json: @prop_bet_sheet.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /prop_bet_sheets/1
  # DELETE /prop_bet_sheets/1.json
  def destroy
    @prop_bet_sheet.destroy
    respond_to do |format|
      format.html { redirect_to prop_bet_sheets_url, notice: 'Prop bet sheet was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_prop_bet_sheet
      @prop_bet_sheet = PropBetSheet.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def prop_bet_sheet_params
      params.require(:prop_bet_sheet).permit(:name, :totals_points, :paid, :prop_bets_attributes => [:id, :question_id, :answer_id, :prop_bet_sheet_id, :super_bowl_id, :user_id, :question_attributes => [:id, :option_ids]])
    end
end
