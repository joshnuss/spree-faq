Rails.application.routes.draw do
  match :faq, :to => 'faqs#index', :as => 'faq'

  namespace :admin do 
    resources :question_categories
  end
end
