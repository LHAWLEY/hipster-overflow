get '/answers' do
  @question = Question.all
  erb :'answers/index'
end

get '/answers/new' do
  erb :'/answers/new'
end

get '/answers/:id' do
  @answer = Answer.find(params[:id])
  erb :'/answers/show'
end

get '/answers/:id/vote' do
  answer = Answer.find(params[:id])
  redirect "/questions/#{answer.question.id}" if !logged_in?
  if answer.votes.find_by(user_id: current_user.id) != nil
    redirect "/questions/#{answer.question.id}"
  else
    new_vote = Vote.new(voter: current_user)
    answer.votes << new_vote
    redirect "/questions/#{answer.question.id}"
  end
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
