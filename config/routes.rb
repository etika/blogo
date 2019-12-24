Rails.application.routes.draw do

devise_scope :user do
  authenticated :user do
    root 'home#index', as: :authenticated_root
  end

  unauthenticated do
    root 'registrations#new', as: :unauthenticated_root
  end
end
  resources :posts do 
   resources :comments #-> url.com/projects/:project_id/comments/:id
   end
   post "/change_status" => "posts#change_status", as: "change_status"
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  devise_for :users, :controllers => {:registrations => "registrations"}
end
