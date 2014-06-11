ClinicalTrialMatcher::Application.routes.draw do

  root "homepage#index"
  get "/blog" => "homepage#blog"
  get "/faq" => "homepage#faq"
  get "/omniauth_callbacks/twitter"
  get "/importer" => 'importer#show'

  post "/importer/run"
  post "/importer/delete_all"
  post "/importer/clear_date"
  post "/importer/new_match_alert"

  get "/user_mailer/new_match_alert"
  post "/user_mailer/new_match_alert"

  get "trials/" => "trials#index", as: :trials
  get "trials/:id" => "trials#show", as: :trial

  devise_for :users, controllers: {omniauth_callbacks: "omniauth_callbacks"}
end
