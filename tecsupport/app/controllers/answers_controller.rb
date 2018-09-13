class AnswersController < ApplicationController
    before_action :set_answer, only: [ :show, :edit, :update, :destroy]
    def index
      # @questions = Question.all
      @questions = Question.page(params[:page])
    end

    def new 
      redirect_to questions_path, notice: 'You must be logged in to answer' if !(current_user)
      @answer = Answer.new 
    end 
    
    def create 
      @answer = Answer.new(answer_params) 
      @answer.valid = true
      
      if 
        @answer.save
        redirect_to questions_path, notice: 'answer was successfully launched.'
      else
        redirect_to  questions_path, notice: 'answer not successfully launched.'
      end
    end
  
    def edit 
      redirect_to posts_path
    end  
  
    def update 
  
      if @answer.update(answer_params)
        redirect_to questions_path, notice: 'answer was successfully updated.'
      else
        render :edit
      end
    end
  
    def destroy 
      @answer.destroy
      respond_to do |format|
        format.html { redirect_to questions_path, notice: 'answer was successfully destructed.' }
      end
    end   
  
  
  private 
  
  def set_answer
    @answer = answer.find(params[:id])
  end
  
  def answer_params
    params.require(:answer).permit(:user_id, :body, :valid, :question_id)
  end
  
  end
  
