Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      resources :events
      resources :administrators
      post '/login', to: 'administrators#login'
      get '/current_admin', to: 'administrators#authorize'
    end
  end
end
