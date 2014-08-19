Rails.application.routes.draw do
  devise_for :users, controllers: { omniauth_callbacks: 'omniauth_callbacks' }
  root 'home#home'
  get 'schedule/:day', to: "schedules#one_day", as: "schedule_for_day"
  get 'schedule', to: "schedules#show_current"

end
