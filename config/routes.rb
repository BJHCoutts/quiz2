Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

# get '/' => 'welcome#index', as: 'root'

resources :ideas do
  resources :reviews
end

resources :users, only: [:new, :create]

resource :sessions, only: [:new, :destroy, :create]

root to: "ideas#index"

end
