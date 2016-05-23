Rails.application.routes.draw do
  resources :posts

  # prototyping with non-resourceful routes
  get '/posts/prototype/:id', to: 'posts#prototype', via: 'get'
  get '/prototoo', to: 'posts#prototoo', via: 'get'
end
