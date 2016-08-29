Rails.application.routes.draw do
  resources :comments
  resources :posts

  scope '/prototypes' do
    resources :fakes, only: [:index, :show]
    resources :test_models, only: [:show]
  end
end
