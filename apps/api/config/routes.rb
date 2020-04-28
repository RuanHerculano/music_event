Rails.application.routes.draw do
  mount_devise_token_auth_for 'User', at: 'auth'

  scope module: :v1, default: { format: :json }, path: 'v1' do

    resources :artist, only: %I(create index)
    resources :genre, only: %I(create index)
  end
end
