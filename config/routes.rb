Rails.application.routes.draw do
  root to: "homes#show"

  resource :dashboard, only: [:show]
end
