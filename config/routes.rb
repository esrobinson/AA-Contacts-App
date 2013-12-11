Project::Application.routes.draw do
  resources :users do
    resources :groups, :only => [:index, :create]

    resources :contacts, :only => [:index, :create] do
      collection do
        get 'favorite'
      end
    end
  end

  resources :groups, :only => [:update, :destroy, :show] do
    member do
      resources :group_members, :only => [:index, :create]
    end
  end


  resources :contacts, :only =>  [:show, :destroy, :update] do
    member do
      resources :comments, :only => [:create]
    end
  end
  resources :contact_shares, :only => [:create, :destroy]
  resources :group_members, :only => [:destroy]
  resources :comments, :only => [:update, :destroy]
end
