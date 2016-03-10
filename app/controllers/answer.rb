get '/answers' do
  @question = Question.all
  erb :'answers/index'
end

get '/answers/new' do
  erb :'/answers/new'
end

post '/answers' do
  new_answer = Answer.new(body: params[:answer], author: current_user )#???
  if new_answer.save
    redirect "/answers"
  else
    #errors
    erb :'answers/new'
  end
end

get '/answers/:id' do
  @answer = Answer.find(params[:id])
  erb :'/answers/show'
end

get '/answers/:id/vote' do
  # @answer = Answer.find(params[:id]) should be user
  @answer.votes << Vote.new#(user)
  redirect "/answers"
end

# for editing an answer
# put '/answers/:id' do
#   answer = Answer.find(params[:id])
#   if answer.update(params[:answer])
#     redirect "/answers/#{answer.id}"
#   else
#     #errors
#     erb :'answer/edit'
# end

delete '/answers/:id' do
  @answer = Answer.find(params[:id])
  @answer.destroy
  redirect '/answers'
end
