Rails.application.routes.draw do
  get 'recommendations', to: 'recommendations#index'
end
