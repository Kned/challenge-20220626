Rails.application.routes.draw do
  mount Rswag::Ui::Engine => '/api-docs'
  mount Rswag::Api::Engine => '/api-docs'
  get "/products", to: "products#index"
  get "/products/:code", to: "products#show"
  root to: "application#root"
end
