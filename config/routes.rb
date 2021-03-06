Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get '/', { to: 'welcome#index', as: :root }
  post '/filtered-events', { to: 'events#filter_events', as: :filter_events}
  get '/filtered-events', { to: 'events#show_filtered_events', as: :show_filtered_events}
  resources :users
  resource :session, only: [:new, :create, :destroy]
  resources :events do
    resources :rsvps, only: [:create, :destroy]
  end
 
end
