get '/' do
  redirect '/answers'
end

get '/answers' do
  erb :index
end

get '/answers/:id/vote' do

  redirect "/answers"
end

delete '/answers/:id' do
  # write logic for deleting answers here.
end

post '/answers' do

  redirect '/answers'
end

get '/answer/:id' do

  erb :answer
end
