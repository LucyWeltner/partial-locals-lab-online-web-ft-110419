Rails.application.routes.draw do
	post '/students/search', to: 'students#search'
  resources :classrooms
  resources :students

end
