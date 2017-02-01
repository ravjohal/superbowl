class SuperBowlsController < ApplicationController
  before_action :set_super_bowl, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!

  # GET /super_bowls
  # GET /super_bowls.json
  def index
    @super_bowls = SuperBowl.all
    unless current_user.role == 1
      redirect_to root_path, :alert => "Access denied."
    end
  end

  # GET /super_bowls/1
  # GET /super_bowls/1.json
  def show
    unless current_user.role == 1
      redirect_to root_path, :alert => "Access denied."
    end
  end

  # GET /super_bowls/new
  def new
    @super_bowl = SuperBowl.new
    unless current_user.role == 1
      redirect_to root_path, :alert => "Access denied."
    end
  end

  # GET /super_bowls/1/edit
  def edit
    unless current_user.role == 1
      redirect_to root_path, :alert => "Access denied."
    end
  end

  # POST /super_bowls
  # POST /super_bowls.json
  def create
    @super_bowl = SuperBowl.new(super_bowl_params)

    respond_to do |format|
      if @super_bowl.save
        format.html { redirect_to @super_bowl, notice: 'Super bowl was successfully created.' }
        format.json { render :show, status: :created, location: @super_bowl }
      else
        format.html { render :new }
        format.json { render json: @super_bowl.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /super_bowls/1
  # PATCH/PUT /super_bowls/1.json
  def update
    respond_to do |format|
      if @super_bowl.update(super_bowl_params)
        format.html { redirect_to @super_bowl, notice: 'Super bowl was successfully updated.' }
        format.json { render :show, status: :ok, location: @super_bowl }
      else
        format.html { render :edit }
        format.json { render json: @super_bowl.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /super_bowls/1
  # DELETE /super_bowls/1.json
  def destroy
    @super_bowl.destroy
    respond_to do |format|
      format.html { redirect_to super_bowls_url, notice: 'Super bowl was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_super_bowl
      @super_bowl = SuperBowl.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def super_bowl_params
      params.require(:super_bowl).permit(:name, :year, :number)
    end
end
