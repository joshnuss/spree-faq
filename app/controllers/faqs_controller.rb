class FaqsController < Spree::BaseController
  helper 'spree/base'

  def index
    @categories = QuestionCategory.all :include => :questions
  end

  def default_title
    I18n.t 'frequently_asked_questions'
  end
end
