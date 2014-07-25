LeePartDeux::Application.routes.draw do
  root 'info#index'

  resources :projects, :only => [:index, :new, :create, :update, :destroy]
  get "projects/:slug" => "projects#show"
  get "projects/:slug/edit" => "projects#edit", as: 'edit_project'
  get "manage-projects" => "projects#manage", as: 'manage_projects'

  resources :info, :only => [:index]
  get 'edit-info', to: 'info#edit', as: "edit_info"
  put 'update-info', to: 'info#update', as: "update_info"

  resources :admin, :only => [:index]

end
