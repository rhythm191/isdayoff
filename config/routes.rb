Rails.application.routes.draw do
  get 'today', to: 'day_off#today'
  get ':day', to: 'day_off#is'

  get 'holiday/:date', to: 'day_off#get_holiday'

  root to: 'day_off#today'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
