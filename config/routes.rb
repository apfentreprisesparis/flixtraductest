Flix::Application.routes.draw do

 #resources :movies
get "movies" => "movies#index"
get "movies/:id" => "movies#show", as: "movie"

end
