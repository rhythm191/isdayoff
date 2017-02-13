Rails.application.routes.draw do
  get 'today', to: 'dayoff#today'
  get ':day', to: 'dayoff#is'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
