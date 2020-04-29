Rails.application.routes.draw do
  mount_devise_token_auth_for 'User', at: 'auth'

  namespace :v1 do
    resources :artist, only: %I(create index)
    resources :genre, only: %I(create index)
    resources :event, only: %I(create index)
  end
end
