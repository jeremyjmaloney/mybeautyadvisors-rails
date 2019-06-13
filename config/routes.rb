Rails.application.routes.draw do

  get '/advisors', to:'advisors#all'

  get '/advisors/:id', to:'advisors#show'

  post '/advisors', to:'advisors#create'

  delete '/advisors/:id', to:'advisors#delete'

  get '/weeks/:id', to:'weeks#show'

  get '/weeks/:id/:date', to:'weeks#find'

  post '/weeks', to:'weeks#create'

  delete '/weeks/:id/:date', to:'weeks#delete'

end
