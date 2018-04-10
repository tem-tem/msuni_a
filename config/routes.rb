Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'msu_disciplines#index'
  resources :msu_disciplines do
    resources :msu_lectures
  end
end
