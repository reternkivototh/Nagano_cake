Rails.application.routes.draw do
  root to: "public/homes#top"
  devise_for :customers, skip: [:passwords], controllers: {
    registrations: "public/registrations",
    sessions: 'public/sessions'
  }
  namespace :public do
    get 'homes/about'
    resources :items, only: [:index, :show]
    resources :cart_items, only: [:index, :create, :update, :destroy]
    resources :orders, only: [:new, :index, :show]
    resources :genres, only: [:show]
    resources :customers, only: [:show, :edit, :unsubscribe, :withdrawal]
    get '/customers/:id/unsubscribe' => 'customers#unsubscribe', as: 'unsubscribe'
    patch '/customers/:id/withdrawal' => 'customers#withdrawl', as: 'withdrawal'
  end


  devise_for :admin, skip: [:registrations, :passwords], controllers: {
    sessions: "admin/sessions"
  }
  namespace :admin do
    get 'homes/top'
    resources :genres, only: [:index, :edit, :create, :update]
    resources :orders, only: [:show]
    resources :customers, only: [:index, :show, :edit]
    resources :items, only: [:index, :show, :edit, :new, :create, :update]
    patch '/admin/genres/:id' => 'genres#update', as: 'update'
    patch '/admin/items/:id' => 'items#update', as: 'update_item'
  end

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
