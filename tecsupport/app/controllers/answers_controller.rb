class AnswersController < ApplicationController
  before_action :set_question, :set_answer, only: [:show, :edit, :update, :destroy]
  

   
  def new 
    redirect_to questions_path, notice: 'You must be logged in to comment' if !(current_user)
    @answer = Answer.new 
  end 
  
  def create 
    @answer = Answer.new(answer_params) 

    if @answer.save
      question_id = @answer.question_id
      user_id = ''
      email=''
       @question = Question.find_by("id = ?", question_id)
       user_id=@question.user_id  
      @user2 = User.find_by("id = ?", user_id)
      UserMailer.newanswer(@user2).deliver_now
      redirect_to questions_path, notice: 'Answer was successfully launched.'
    else
      render :new 
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
    params.require(:answer).permit(:user_id, :body, :question_id)
  end
  
  end
  
