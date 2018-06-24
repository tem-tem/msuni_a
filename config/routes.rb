Rails.application.routes.draw do

  default_url_options host: "localhost:3000"

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  mount PdfjsViewer::Rails::Engine => "/pdfjs", as: 'pdfjs'
  root 'static_pages#client_side'

  get 'lectures', to: 'client_pages#get_lecture_list'
  get 'lecture', to: 'client_pages#get_lecture_content'
  get 'set_discipline', to: 'client_pages#set_discipline'

  get    '/admin',        to: 'sessions#new'
  post   '/admin',        to: 'sessions#create'
  post   '/admin/auth',   to: 'sessions#auth'
  delete '/logout',       to: 'sessions#destroy'

  namespace :admin do

    resources :msu_disciplines do
      resources :msu_lectures
      resources :msu_files
      resources :msu_videos, only: [:new, :create, :destroy, :parse]
    end

    resources :msu_lectures do
      resources :msu_presentations
      resources :msu_images
    end

    resources :msu_lectures, only: :index
    resources :msu_presentations, only: :index
    resources :msu_users, only: [:index, :new, :create, :destroy]

    get 'msu_discipline/:id/toggle', to: 'msu_disciplines#toggle', as: 'toggle_discipline'
    get 'msu_lecture/:id/toggle', to: 'msu_lectures#toggle', as: 'toggle_lecture'

    get '/reorderlectures', to: 'msu_lectures#reorder'
    get 'upload', to: 'msu_presentations#upload'
  end

end
