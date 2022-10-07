Rails.application.routes.draw do
  resources :birds, only: [:index, :show, :create, :update]

  # breaking RESTFUL CONVENTIONS by adding custom route to handle "likes" button click action.
  # BEST PRACTICE, CREATE DIFFERENT CONTROLLER FOR CUSTOM ROUTES
  # http://jeromedalbert.com/how-dhh-organizes-his-rails-controllers/

  patch "/birds/:id/like", to: "birds#increment_likes"
end
