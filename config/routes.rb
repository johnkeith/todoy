Rails.application.routes.draw do
  devise_for :users, controllers: { omniauth_callbacks: 'omniauth_callbacks' }
  root 'home#home'
  get 'schedule', to: "schedules#show_current_day"
  get 'schedule/:day', to: "schedules#show_day", as: "schedule_for_day"
end
