Rails.application.routes.draw do
  resources :users, only: [:index, :show]

  extend ApiRoutes
  extend AdminRoutes
end
