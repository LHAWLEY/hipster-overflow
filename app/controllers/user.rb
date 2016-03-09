get '/users' do
  erb :index
end

get '/users/:id/vote' do

  redirect "/users"
end

delete '/users/:id' do
  # write logic for deleting users here.
end

post '/users' do

  redirect '/users'
end

get '/user/:id' do

  erb :show
end
