module Admin::QuestionCategoriesHelper
  def add_question_link(name)
    link_to_function name do |page|
      page << %{
        var new_question_id = "new_" + new Date().getTime();
        jQuery('#questions').append(new_question_html.replace(/new_\\d+/g, new_question_id));
        jQuery().scrollTo(jQuery('#questions .question:last'), 800);
      }
    end
  end

end
