Rails.application.routes.draw do
  devise_for :users
  resources :taxpayers
  resources :system_configurations, only: [:index]
  namespace :system_configurations do
    resources :line_of_businesses do
      resources :gross_sale_taxes
      resources :business_taxes
      resources :percentage_taxes 
    end
  end
end
