get '/answers' do
  @question = Question.all
  erb :'answers/index'
end

post '/answers' do
  redirect '/answers'
end

get '/answers/:id/vote' do
  @answer = Answer.find(params[:id])
  @answer.votes << Vote.new
  redirect "/answers"
end

get '/answers/:id' do
  @answer = Answer.find_by(id: params[:id])
  if @answer
    erb :'/answers/show'
  else
    erb :'/answers'
  end
end

delete '/answers/:id' do
  @answer = Answer.find(params[:id])
  @answer.destroy
  redirect '/answers'
end
