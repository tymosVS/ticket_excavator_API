Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :requst_handler, path: '', only: [:create]
  resources :tikets, path: '', only: [:index, :show]
end
