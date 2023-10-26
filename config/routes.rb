Rails.application.routes.draw do
  resources :projects
  root to: "home#index"
  get "portfolio" => "projects#index"
  get "/auth/:provider/callback", to: 'projects#index'
end