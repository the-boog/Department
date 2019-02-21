Rails.application.routes.draw do
  resources :types do
    resources :items
  end
end
