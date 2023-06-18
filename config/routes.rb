Rails.application.routes.draw do
  root to: "public/homes#top"
  devise_for :customer, skip: [:passwords], controllers: {
    registrations: "public/registrations",
    sessions: 'public/sessions'
  }
  namespace :public do
    resources :items, only: [:index, :show]
    resources :cart_items, only: [:index, :create, :update, :destroy]
    resources :orders, only: [:new, :index, :show]
    resources :genres, only: [:show]
    resources :customers, only: [:show, :edit]
  end

  namespace :public do
    get 'homes/top'
    get 'homes/about'
  end


  namespace :admin do
    get 'homes/top'
  end
  devise_for :admin, skip: [:registrations, :passwords], controllers: {
    sessions: "admin/sessions"
  }

  resources :genres, only: [:index, :edit]
  resources :orders, only: [:show]
  resources :customers, only: [:index, :show, :edit]
  resources :customers, only: [:index, :show, :edit, :new]

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
