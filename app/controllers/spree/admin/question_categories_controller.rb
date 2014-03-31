module Spree
  module Admin
    class QuestionCategoriesController < ResourceController
      before_filter :question_category, only: [:new, :edit]

      private

      def question_category
        @question_category ||= @object
      end

      def question_category_params
        params.require(:question_category).permit(:questions_attributes, :question, :answer,
                       question: [:question_category_id, :question, :answer])
      end
    end
  end
end
