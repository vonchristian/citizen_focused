Rails.application.routes.draw do
  devise_for :users
  devise_for :taxpayers

  resources :businesses, except: [:new, :create] do
    resources :additional_fees, only: [:new, :create], module: :businesses
    resources :business_activities, only: [:new, :create], module: :businesses
    resources :assessments, only: [:new, :create], module: :businesses
    resources :payments, only: [:new, :create, :show], module: :businesses
  end
  resources :business_activities do
    resources :gross_sales, only: [:new, :create], module: :businesses
  end
  namespace :bpls do
    resources :taxpayers do
      resources :businesses, only: [:new, :create], module: :taxpayers
    end
  end
  resources :system_configurations, only: [:index]
  namespace :system_configurations do
    resources :retailer_gross_sale_minimums, only: [:new, :create]
    resources :fees, only: [:index, :new, :create]
    resources :line_of_businesses do
      resources :gross_sale_taxes
      resources :business_taxes
      resources :percentage_taxes
    end
  end

  namespace :accounting do
    resources :accounts, only: [:index, :new, :create] do
    match "/enable" => "/accounting/accounts#enable", via: [:post], on: :member
    match "/disable" => "/accounting/accounts#disable", via: [:post], on: :member
  end
  end
end
