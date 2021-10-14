Rails.application.routes.draw do
  
  get "contact", to: "pages#contact"
  get "about", to: "pages#about"
  get "error", to: "pages#error"

  get "blog", to: redirect("http://jordanhudgens.com")

  resources :projects do
    resources :tasks, except: [:index], controller: 'projects/tasks'
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root 'pages#home'

  get "*path", to: redirect("/error")
end
