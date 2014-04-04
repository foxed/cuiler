Cuiler::Application.routes.draw do
  root "homes#show"

  resources :admins, only: :new
end
