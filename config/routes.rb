Rails.application.routes.draw do
  require "sidekiq/web"
  mount Sidekiq::Web => "/sidekiq"

  devise_for :users, controllers: { registrations: "users/registrations" }


  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  get "dashboard", to: "dashboard#index"
  post "dashboard/find_match", to: "dashboard#find_match", as: "find_match"
  post "dashboard/export_csv", to: "dashboard#export_csv", as: "export_csv"

  root to: "dashboard#index"
end
