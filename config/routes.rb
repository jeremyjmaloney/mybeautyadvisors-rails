Rails.application.routes.draw do

  get '/stores', to:'stores#allStores'

  get '/stores/:id', to:'stores#showStore'

  post '/stores', to:'stores#createStore'

  delete '/stores/:id', to:'stores#deleteStore'

  get '/advisors', to:'advisors#allAdvisors'

  get '/advisors/:id', to:'advisors#showAdvisor'

  post '/advisors', to:'advisors#createAdvisor'

  delete '/advisors/:id', to:'advisors#deleteAdvisor'

  get '/weeks/:id', to:'weeks#showWeeks'

  get '/weeks/:id/:weekId', to:'weeks#findWeek'

  post '/weeks', to:'weeks#createWeek'

  delete '/weeks/:id/:weekId', to:'weeks#deleteWeek'

end
