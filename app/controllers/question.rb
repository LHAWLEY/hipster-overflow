get '/' do
  redirect '/questions'
end

get '/questions' do
  erb :index
end

get '/questions/:id/vote' do

  redirect "/questions"
end

delete '/questions/:id' do
  # write logic for deleting questions here.
end

post '/questions' do

  redirect '/questions'
end

get '/question/:id' do

  erb :question
end
