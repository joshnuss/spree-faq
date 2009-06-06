class FaqsController < ApplicationController
  helper 'spree/base'

  def index
    @categories = QuestionCategory.all :include => :questions
  end

  def show
    @question = Question.find(params[:id])
  end
end
