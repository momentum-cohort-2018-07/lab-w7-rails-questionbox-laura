class QuestionsController < ApplicationController
  before_action :set_question, only: [:show, :edit, :update, :destroy]

  # GET /questions
  def index
    # @questions = Question.all
    @questions = Question.page(params[:page])
  end

  # GET /questions/1
  def show
  end

  # GET /questions/new
  def new
    redirect_to questions_path, notice: 'You must be logged in to add a new question' if !(current_user)
    @question = Question.new
  end

  # question /questions
  def create
    @question = Question.new(question_params)

    if @question.save
      redirect_to @question, notice: 'question was successfully recorded.'
    else
      render :new, notice: "Something went wrong. Please try again."
    end
  end

  # PATCH/PUT /questions/1
  def update
    if @question.update(question_params)
      redirect_to @question, notice: 'question was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /questions/1
  def destroy
    @question.destroy
    respond_to do |format|
      format.html { redirect_to questions_url, notice: 'question was successfully destructed.' }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_question
      @question = Question.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def question_params
      params.require(:question).permit(:title, :body, :user_id)
    end
end
