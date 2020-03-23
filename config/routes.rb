Rails.application.routes.draw do
  
  resources :athletes
namespace :api do
  namespace :v1 do
    resources :users
    resources :topics do
      resources :comments
    end
  end
end

end