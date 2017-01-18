Rails.application.routes.draw do
  devise_for :users
  resources :businesses, except: [:new, :create] do
    resources :business_activities, only: [:new, :create], module: :businesses
  end
  resources :business_activities do
    resources :gross_sales, only: [:new, :create], module: :businesses
  end
  resources :taxpayers do
    resources :businesses, only: [:new, :create], module: :taxpayers
  end
  resources :system_configurations, only: [:index]
  namespace :system_configurations do
    resources :retailer_gross_sale_minimums, only: [:new, :create]
    resources :line_of_businesses do
      resources :gross_sale_taxes
      resources :business_taxes
      resources :percentage_taxes
    end
  end
end
