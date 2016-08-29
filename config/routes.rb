Fotofm2::Application.routes.draw do
    namespace :admin do
      resources :sections do
      	resources :galleries 
      end
    end
    
    resources :sections, only: [:show]
    resources :images

    root to: redirect('/images')  

end
