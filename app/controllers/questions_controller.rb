class QuestionsController < ApplicationController
  before_action :set_question, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!

  # GET /questions
  # GET /questions.json
  def index
    @questions = Question.where(:super_bowl_id => @current_super_bowl_id)
    @total_weight = 0
    @questions.each do |q|
      @total_weight += q.weight
    end

    unless current_user.role == 1
      redirect_to root_path, :alert => "Access denied."
    end
  end

  def all_questions
    @questions = Question.all

    unless current_user.role == 1
      redirect_to root_path, :alert => "Access denied."
    end
  end

  # GET /questions/1
  # GET /questions/1.json
  def show
    unless current_user.role == 1
      redirect_to root_path, :alert => "Access denied."
    end
  end

  # GET /questions/new
  def new
    @question = Question.new

    # @answer_list = Answer.by_super_bowl(@super_bowl)
    @answer_list = Answer.all

    unless current_user.role == 1
      redirect_to root_path, :alert => "Access denied."
    end
  end

  # GET /questions/1/edit
  def edit
     # @answer_list = Answer.by_super_bowl(@super_bowl)
    @answer_list = Answer.all
    unless current_user.role == 1
      redirect_to root_path, :alert => "Access denied."
    end
  end

  # POST /questions
  # POST /questions.json
  def create
    @question = Question.new(question_params)
    @question.super_bowl = @super_bowl

    respond_to do |format|
      if @question.save
        format.html { redirect_to @question, notice: 'Question was successfully created.' }
        format.json { render :show, status: :created, location: @question }
      else
        format.html { render :new }
        format.json { render json: @question.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /questions/1
  # PATCH/PUT /questions/1.json
  def update
    respond_to do |format|
      if @question.update(question_params)
        format.html { redirect_to @question, notice: 'Question was successfully updated.' }
        format.json { render :show, status: :ok, location: @question }
      else
        format.html { render :edit }
        format.json { render json: @question.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /questions/1
  # DELETE /questions/1.json
  def destroy
    @question.destroy
    respond_to do |format|
      format.html { redirect_to questions_url, notice: 'Question was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_question
      @question = Question.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def question_params
      params.require(:question).permit(:question, :weight, :super_bowl_id, :correct_answer_id, :correct_answer_attributes => [:id, :name], :options_ids => [], :answer_ids => [], :options_attributes => [:id, :name])
    end
end
