Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  resources :courses do
    resources :course_pages
  end

  resources :dashboard, only: [] do
    collection do
      get :expired_and_active_courses_storage
      get :top_courses
    end
  end
end
