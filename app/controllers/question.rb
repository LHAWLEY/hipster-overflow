get '/questions' do
  # find a way to display questions only associated with the user
  @questions = Question.all
  erb :'index'
end

# put in redirect to user login form
get '/questions/new' do
   erb :'questions/new'
 end

  # only users should be able to add new questions
  # will put an if/else at the top of the new question form asking for session permission
  # Need to include user id field for login
 post '/questions/new' do
   @question = Question.new(title: params[:title], body: params[:body] , author: current_user)
   if @question.save
     redirect '/'
   else
     @errors = @question.errors.full_messages
     erb :'questions/new'
   end
 end

post '/questions/:id/answer' do
  @new_answer = Answer.new(body: params[:answer], user_id: current_user.id, question_id: params[:id])
  if request.xhr?
    @new_answer.save
    erb :'questions/_new_answer', locals: { answer: @new_answer }, layout: false
  else
    redirect "/questions/#{params[:id]}"
  end
end

get '/questions/:id' do
  @question = Question.find(params[:id])
  erb :'questions/show'
end

get '/questions/:id/delete' do
  question = Question.find(params[:id])
  if question.user_id == current_user.id
    question.destroy
    redirect '/questions'
  end
  redirect "/questions/#{question.id}"
end

post '/questions/:id/comments' do
  question = Question.find(params[:id])
  question.comments.create(body: params[:comment][:body], commentor: current_user)

  if request.xhr?

  else
    redirect "/questions/#{question.id}"
  end

end

get '/questions/:id/vote' do
  question = Question.find(params[:id])
  redirect "/questions/#{question.id}" if !logged_in?
  if question.votes.find_by(user_id: current_user.id) == nil
    new_vote = Vote.new(voter: current_user)
    question.votes << new_vote
    redirect "/questions/#{question.id}"
  else
    redirect "/questions/#{question.id}"
  end
end

get '/questions/:id/delete-vote' do
  question = Question.find(params[:id])
  redirect "/questions/#{question.id}" if !logged_in?
  vote = question.votes.find_by(user_id: current_user.id)
  vote.destroy
  redirect "/questions/#{question.id}"
end
