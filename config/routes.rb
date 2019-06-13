Rails.application.routes.draw do

  get '/advisors', to:'advisors#allAdvisors'

  get '/advisors/:id', to:'advisors#showAdvisor'

  post '/advisors', to:'advisors#createAdvisor'

  delete '/advisors/:id', to:'advisors#deleteAdvisor'

  get '/weeks/:id', to:'weeks#showWeeks'

  get '/weeks/:id/:date', to:'weeks#findWeek'

  post '/weeks', to:'weeks#createWeek'

  delete '/weeks/:id/:date', to:'weeks#deleteWeek'

end
