Rails.application.routes.draw do
  devise_for :users
    root to: 'application#angular'

  resources :lists, only: [:create, :index, :show] do
    resources :tasks, only: [:show, :create] do
      member do
        put '/upvote' => 'tasks#upvote'
        put '/update' => 'tasks#update'
        delete '/destroy' => 'tasks#destroy'
      end
    end

    member do
      delete '/destroy' => 'lists#destroy'
      put '/upvote' => 'lists#upvote'
      put '/update' => 'lists#update'
    end
  end
end
