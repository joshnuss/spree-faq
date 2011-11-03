Rails.application.routes.draw do

  match :faq, :to => 'faqs#index', :as => 'faq'
  
  namespace :admin do 
    resources :question_categories
    match :faq, :to => 'question_categories#index'
  end
  
end
