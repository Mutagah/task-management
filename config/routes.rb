Rails.application.routes.draw do
  resources :tasks
  post "/task_status", to: 'tasks#status'
  delete "/tasks_delete", to: 'tasks#tasks_delete'
end
