Rails.application.routes.draw do
  root 'tops#index'

  resources :apply_feature_flags, only: %i[create]
end
