class HomeController < ApplicationController
  def index
  end

  def questions
    @questions = Question.all
  end
end
