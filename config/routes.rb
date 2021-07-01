Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root 'users#welcome'
  get '/auth/:provider/callback' => 'sessions#omniauth'
  get '/home' => 'users#home'
  delete '/logout' => 'sessions#destroy'
  get '/alarms/test' => 'alarms#test'
  resources :alarms
end
