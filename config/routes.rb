Rails.application.routes.draw do
  root 'static_pages#home'
  get "/members", to: "static_pages#members"
  resource :session, only: [:new, :create, :destroy]
end
