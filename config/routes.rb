Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  mount PdfjsViewer::Rails::Engine => "/pdfjs", as: 'pdfjs'
  root 'static_pages#client_side'

  get 'lectures', to: 'client_pages#get_lecture_list'
  get 'lecture', to: 'client_pages#get_lecture_content'
  get 'set_discipline', to: 'client_pages#set_discipline'
  get 'admin', to: 'static_pages#admin'
  namespace :admin do

    resources :msu_disciplines do
      resources :msu_lectures
    end

    resources :msu_lectures do
      resources :msu_presentations
      resources :msu_images
    end

    get 'upload', to: 'msu_presentations#upload'

    resources :msu_lectures, only: :index
    resources :msu_presentations, only: :index

  end

end
