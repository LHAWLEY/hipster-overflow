get '/' do
  redirect '/comments'
end

get '/comments' do
  erb :index
end

get '/comments/:id/vote' do

  redirect "/comments"
end

delete '/comments/:id' do
  # write logic for deleting comments here.
end

post '/comments' do

  redirect '/comments'
end

get '/comment/:id' do

  erb :comment
end
