Rails.application.routes.draw do
  root to: "public/items#index"
  devise_for :customers, skip: [:passwords], controllers: {
    registrations: "public/registrations",
    sessions: 'public/sessions'
  }
  namespace :public do
    resources :items, only: [:index, :update, :destroy, :create]
    resources :customers, only: [:show, :edit, :update]
  end
  get "public/customers/:id/confirm_with" => "public/customers#confirm_with", as: "confirm_with"
  patch "public/customers/:id/withdraw" => "public/customers#withdraw", as: "withdraw"
# 管理者用
# URL /admin/sign_in ...
  devise_for :admin, skip: [:registrations, :passwords], controllers: {
    sessions: "admin/sessions"
  }
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  namespace :admin do
    resources :items, only: [:index, :new, :create, :show, :edit, :update]
    resources :customers, only: [:index, :show, :edit, :update]
  end
end
