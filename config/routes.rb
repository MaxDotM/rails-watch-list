Rails.application.routes.draw do
  get 'bookmarks/new'
  get 'movies/index'
  get 'movies/show'
  get 'movies/new'
  get 'movies/edit'
  get "up" => "rails/health#show", as: :rails_health_check
  root to: 'lists#index'
  resources :lists, only: %i[index new show create destroy] do
    resources :bookmarks, only: %i[new create]
  end
  resources :bookmarks, only: [:destory]
  resources :movies, only: %i[index show new create edit update destroy]
end
