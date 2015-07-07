class AnswersController < ApplicationController
  def create
    @question = Question.find(params[:question_id])
    @user = current_user
    @answer = @question.answers.new(answer_params)
    @user.answers.push(@answer)
    if @answer.save
      flash[:notice] = "Your answer has been added!"
    else
      flash[:notice] = "Uh oh. Something went wrong. Try again."
    end
    redirect_to user_question_path(@question.user, @question)
  end

  private
  def answer_params
    params.require(:answer).permit(:body, :user_id, :question_id)
  end
end
