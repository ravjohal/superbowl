class PropBetsController < ApplicationController
  before_action :set_prop_bet, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!

  # GET /prop_bets
  # GET /prop_bets.json
  def index
    @prop_bets = PropBet.all
    unless current_user.role == 1
      redirect_to root_path, :alert => "Access denied."
    end
  end

  # GET /prop_bets/1
  # GET /prop_bets/1.json
  def show
    unless current_user.role == 1
      redirect_to root_path, :alert => "Access denied."
    end
  end

  # GET /prop_bets/new
  def new
    @prop_bet = PropBet.new
    unless current_user.role == 1
      redirect_to root_path, :alert => "Access denied."
    end
  end

  # GET /prop_bets/1/edit
  def edit
    unless current_user.role == 1
      redirect_to root_path, :alert => "Access denied."
    end
  end

  # POST /prop_bets
  # POST /prop_bets.json
  def create
    @prop_bet = PropBet.new(prop_bet_params)

    respond_to do |format|
      if @prop_bet.save
        format.html { redirect_to @prop_bet, notice: 'Prop bet was successfully created.' }
        format.json { render :show, status: :created, location: @prop_bet }
      else
        format.html { render :new }
        format.json { render json: @prop_bet.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /prop_bets/1
  # PATCH/PUT /prop_bets/1.json
  def update
    respond_to do |format|
      if @prop_bet.update(prop_bet_params)
        format.html { redirect_to @prop_bet, notice: 'Prop bet was successfully updated.' }
        format.json { render :show, status: :ok, location: @prop_bet }
      else
        format.html { render :edit }
        format.json { render json: @prop_bet.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /prop_bets/1
  # DELETE /prop_bets/1.json
  def destroy
    @prop_bet.destroy
    respond_to do |format|
      format.html { redirect_to prop_bets_url, notice: 'Prop bet was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_prop_bet
      @prop_bet = PropBet.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def prop_bet_params
      params.fetch(:prop_bet, {})
    end
end
