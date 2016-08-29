Fotofm2::Application.routes.draw do
    namespace :admin do
      resources :sections do
        resources :galleries 
      end
    end
    
    resources :sections, only: [:show] do
      resources :galleries do
        get :thumbnail, on: :member       
      end
    end

    resources :images

    root to: redirect('/images')  

end
