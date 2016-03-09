get '/votes' do
  erb :index
end

get '/votes/:id/vote' do

  redirect "/votes"
end

delete '/votes/:id' do
  # write logic for deleting votes here.
end

post '/votes' do

  redirect '/votes'
end

get '/vote/:id' do

  erb :vote
end
