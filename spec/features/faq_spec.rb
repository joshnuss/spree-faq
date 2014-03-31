require 'spec_helper'

feature 'FAQ', :js do

  given!(:user) { create(:user) }
  given!(:question_category) { create(:question_category, name: 'Shopping') }
  given!(:question) do
    create(:question,
      question_category: question_category,
      question: 'Do you sell stuff?',
      answer: 'Think so..')
  end

  background do
    visit spree.faq_path
  end

  scenario 'have all elements' do
    expect(page).to have_text Spree.t(:frequently_asked_questions, scope: :spree_faq)
    expect(page).to have_text 'Shopping'
    expect(page).to have_text 'Do you sell stuff?'
  end

  context 'when click on question' do
    scenario 'show answer' do
      click_link 'Do you sell stuff?'
      expect(page).to have_text 'Think so..'
    end
  end
end
