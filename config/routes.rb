Rails.application.routes.draw do
  ActiveAdmin.routes(self)
  root to: 'homes#index'

  namespace :api, {format: 'json'} do
    namespace :v1 do
      resources :employees, only: %i[index show create update destroy]
    end
  end
end
