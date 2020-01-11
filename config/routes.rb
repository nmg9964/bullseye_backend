Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      resources :events
      resources :administrators
      post '/login', to: 'administrators#login'
      post '/admin', to: 'administrators#show'
    end
  end
end
