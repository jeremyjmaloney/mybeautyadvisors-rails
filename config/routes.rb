Rails.application.routes.draw do

  get '/stores', to:'stores#allStores'

  get '/stores/:id', to:'stores#showStore'

  post '/stores', to:'stores#createStore'

  delete '/stores/:id', to:'stores#deleteStore'

  get '/advisors/:storeNum', to:'advisors#allAdvisors'

  get '/advisors/:storeNum/:id', to:'advisors#showAdvisor'

  post '/advisors', to:'advisors#createAdvisor'

  delete '/advisors/:id', to:'advisors#deleteAdvisor'

  get '/weeks/:advisorId', to:'weeks#allWeeks'

  get '/weeks/:advisorId/:id', to:'weeks#showWeek'

  post '/weeks', to:'weeks#createWeek'

  delete '/weeks/:id', to:'weeks#deleteWeek'

end
