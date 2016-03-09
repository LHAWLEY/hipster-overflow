get '/' do
  redirect '/posts'
end

get '/posts' do
  erb :index
end

get '/posts/:id/vote' do

  redirect "/posts"
end

delete '/posts/:id' do
  # write logic for deleting posts here.
end

post '/posts' do

  redirect '/posts'
end

get '/post/:id' do

  erb :post
end
