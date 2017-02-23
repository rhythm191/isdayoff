Rails.application.routes.draw do
  get 'countries', to: 'calendars#countries'

  get 'today', to: 'day_off#today'
  get ':day', to: 'day_off#is'

  root to: 'day_off#today'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
