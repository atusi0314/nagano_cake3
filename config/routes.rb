Rails.application.routes.draw do
  root to: "public/items#index"
  devise_for :customers, skip: [:passwords], controllers: {
    registrations: "public/registrations",
    sessions: 'public/sessions'
  }
  delete "public/cart_items/destroy_all" => "public/cart_items#destroy_all", as: "destroy_all"
  namespace :public do
    resources :items, only: [:index, :show]
    resources :customers, only: [:show, :edit, :update]
    resources :cart_items, only: [:index, :update, :create, :destroy]
    resources :orders, only: [:new, :create, :index, :show]
  end
  get "public/customers/:id/confirm_with" => "public/customers#confirm_with", as: "confirm_with"
  patch "public/customers/:id/withdraw" => "public/customers#withdraw", as: "withdraw"
  post "public/orders/confirm" => "public/orders#confirm", as: "confirm"
  get "public/orders/complete" => "public/orders#complete", as: "complete"
  
# 管理者用
# URL /admin/sign_in ...
  devise_for :admin, skip: [:registrations, :passwords], controllers: {
    sessions: "admin/sessions"
  }
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  namespace :admin do
    resources :items, only: [:index, :new, :create, :show, :edit, :update]
    resources :customers, only: [:index, :show, :edit, :update]
    resources :customers, only: [:index, :show, :edit, :update]
  end
end
