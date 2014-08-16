Rails.application.routes.draw do
  devise_for :users, controllers: { omniauth_callbacks: 'omniauth_callbacks' }
  root 'home#home'
  get 'schedule', to: "schedules#show_current"
end
