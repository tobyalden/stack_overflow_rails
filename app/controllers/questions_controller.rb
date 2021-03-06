class QuestionsController < ApplicationController

  def show
    @question = Question.find(params[:id])
    @user = @question.user
    @answers = @question.answers
  end

  def new
    @question = Question.new
  end

  def create
    @user = User.find(params[:user_id])
    @question = @user.questions.new(question_params)
    if @question.save
      flash[:notice] = "Question has been successfully added!"
      redirect_to "/"
    else
      flash[:notice] = "There was a problem posting your question. Try again."
      render :new
    end
  end

  private
  def question_params
    params.require(:question).permit(:title, :body, :user_id)
  end
end
