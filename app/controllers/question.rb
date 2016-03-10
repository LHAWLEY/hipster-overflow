get '/questions' do
  # find a way to display questions only associated with the
  @questions = Question.all
  erb :'index'
end

# only users should be able to add new questions
# will put an if/else at the top of the new question form asking for session permission
# Need to include user id field for login

get '/questions/:id' do
  @question = Question.find(params[:id])
  erb :'questions/show'
end

delete '/questions/:id' do
  # write logic for deleting questions here.
end
