Rails.application.routes.draw do
  resources :projects
  root to: "home#index"
  get "/auth/:provider/callback", to: 'sessions#create'
  get "/auth/exit", to: 'sessions#destroy'
  get "/contacts", to: 'contacts#index'
  get "/facebook", to: redirect("https://www.facebook.com/vladloz/")
  get "/linkedin", to: redirect("https://www.linkedin.com/in/vlad-lozynskyi-756a324a/")
  get "/telegram", to: redirect("https://t.me/vladloz")
  get "/github", to: redirect("https://github.com/vladlozzi")
end