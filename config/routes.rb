Rails.application.routes.draw do
  root to: "tops#top"
  resources :sessions, only: [:new, :create, :destroy]
  resources :favorites, only: [:create, :destroy, :show]
  resources :users, only: [:new, :create, :show]
  resources :ics do
    collection do
      post :confirm
    end
  end
  if Rails.env.development?
  mount LetterOpenerWeb::Engine, at: "/inbox"
  end
end
