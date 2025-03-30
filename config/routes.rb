Rails.application.routes.draw do
  if Rails.env.test?
    namespace :test do
      resource :session, only: %i[create]
    end
  end
  resources :projects
  root to: "home#index"
  get "/auth/:provider/callback", to: 'sessions#create'
  get "/auth/exit", to: 'sessions#destroy'
  get "/contacts", to: 'contacts#index'
  get "/facebook", to: redirect("https://www.facebook.com/vladloz/")
  get "/telegram", to: redirect("https://t.me/vladloz")
  get "/github", to: redirect("https://github.com/vladlozzi")
end