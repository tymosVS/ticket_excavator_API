Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :request_handller, path: '', only: [:create]
  resources :tikets, path: '', only: [:index, :show]

  root 'tikets#index'
end
