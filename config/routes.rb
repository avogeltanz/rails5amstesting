Rails.application.routes.draw do
  resources :comments
  resources :posts

  scope '/prototypes' do
    resources :fakes, only: [:index, :show]
  end
end
