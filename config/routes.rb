Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      resources :events
      resources :administrators
      post '/login', to: 'administrators#login'
      get '/current_admin', to: 'administrators#authorize'
      # get '/available_times/:date', to: 'events#find_times'
    end
  end
end
