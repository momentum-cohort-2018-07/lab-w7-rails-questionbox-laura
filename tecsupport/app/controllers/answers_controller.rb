class AnswersController < ApplicationController
  before_action :set_question, only: [:show, :edit, :update, :destroy]
  before_action :set_answer, only: [:show, :edit, :update, :destroy]
  
  
    
    
   
    def new 
      redirect_to questions_path, notice: 'You must be logged in to answer' if !(current_user)
      @answer = Answer.new 
    end 
    
    def create 
        @question = Answer.find(params[:question_id])
        @answer = @question.answer.create(answer_params)
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
    params.require(:answer).permit(:user_id, :body, :question_id)
  end
  
  end
  
