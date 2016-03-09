get '/answers' do
  @question_answers = Answer.all
  erb :'/answers'
end

get '/answers/:id/vote' do
  @answer = Answer.find(params[:id])
  @answer << Vote.new
  redirect "/answers"
end

delete '/answers/:id' do
  @answer = Answer.find(params[:id])
  @answer.destroy
  redirect '/answers'
end

# post '/answers' do
#
#   redirect '/answers'
# end

get '/answer/:id' do
  @answer = Answer.find(params[:id])
  erb :'/answer/show'
end
