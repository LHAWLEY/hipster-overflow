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
    if request.xhr?
      answer.total_votes.to_s
    else
      redirect "/questions/#{answer.question.id}"
    end
  else
    new_vote = Vote.new(voter: current_user)
    answer.votes << new_vote
   if request.xhr?
      answer.total_votes.to_s
    else
      redirect "/questions/#{answer.question.id}"
    end
  end

  if request.xhr?
    answer.total_votes.to_s
  else
    redirect "/questions/#{answer.question.id}"
  end
end

get '/answers/:id/delete-vote' do
  answer = Answer.find(params[:id])
  redirect "/answers/#{answer.id}" if !logged_in?
  vote = answer.votes.find_by(user_id: current_user.id)
  vote.destroy if vote
  if request.xhr?
    answer.total_votes.to_s
  else
    redirect "/questions/#{answer.question.id}"
  end
end

post '/answers/:id/comments' do
  answer = Answer.find(params[:id])
  new_comment = answer.comments.create(body: params[:comment][:body], commentor: current_user)

  if request.xhr?
    content_type :json
    {id: answer.id, body: new_comment.body, username: new_comment.commentor.username}.to_json
  else
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
