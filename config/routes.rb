Rails.application.routes.draw do
  resources :cocktails, only: [:index, :new, :create, :show] do
    # c est pour avoir le l'id du cocktail dans le chemin,
    # comme ca on le recupere dans le html
    #  /cocktails/id/dose
    resources :doses, only: [:new, :create]
  end
  resources :doses, only: [:destroy]

  # le to: en dessous n'est pas obligatoire
  root to: 'cocktails#index'
end
