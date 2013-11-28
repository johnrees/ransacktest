Ransacktest::Application.routes.draw do
  resources :cheeses
  root to: 'cheeses#index'
end
