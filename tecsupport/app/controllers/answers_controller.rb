class AnswersController < ApplicationController
    before_action :set_answer, only: [:show, :edit, :update, :destroy]
  

    def new 
      redirect_to post_path, notice: 'You must be logged in to answer' if !(current_user)
      @answer = Answer.new 
    end 
    
    def create 
      @answer = answer.new(answer_params) 
  
      if @answer.save
        redirect_to @answer.post, notice: 'answer was successfully launched.'
      else
        render :new 
      end
    end
  
    def edit 
      redirect_to posts_path
    end  
  
    def update 
  
      if @answer.update(answer_params)
        redirect_to post_path, notice: 'answer was successfully updated.'
      else
        render :edit
      end
    end
  
    def destroy 
      @answer.destroy
      respond_to do |format|
        format.html { redirect_to post_path, notice: 'answer was successfully destructed.' }
      end
    end   
  
  
  private 
  
  def set_answer
    @answer = answer.find(params[:id])
  end
  
  def answer_params
    params.permit(:post_id, :user_id, :answer)
  end
  
  end
  
