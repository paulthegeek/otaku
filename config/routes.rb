Rails.application.routes.draw do
  root to: "homes#show", via: :get
  
  resource :dashboard, only: [:show]
end
