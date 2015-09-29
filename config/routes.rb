Rails.application.routes.draw do
  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  resources :orders do
    resource :checkout
  end
  root 'orders#index'
end
