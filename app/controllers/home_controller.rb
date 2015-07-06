class HomeController < ApplicationController

  def index
    @questions = Question.all.sort_by{ |object| [object.created_at] }.reverse
  end

end
