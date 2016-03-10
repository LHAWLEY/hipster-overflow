get '/questions' do
  @questions = Question.all
  erb :index
end

get '/questions/new' do
  erb :'questions/new'
end

# only users should be able to add new questions
# will put an if/else at the top of the new question form asking for session permission
# Need to include user id field for login
post '/questions/new' do
  "hello"
  @question = Question.new(title: params[:title], body: params[:body] , author: current_user)
  if @question.save
    redirect '/'
  else
    @errors = @question.errors.full_messages
    "something fucked up"
    erb :'questions/new'
  end
end

get '/questions/:id' do
  "hello"
  erb :'questions/show'
end

delete '/questions/:id' do
  # write logic for deleting questions here.
end
