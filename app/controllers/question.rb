
# get '/questions' do
#   erb :index
# end

get '/questions/new' do
  erb :'questions/new'
end

# only users should be able to add new questions
# will put an if/else at the top of the new question form asking for session permission
post '/questions/new' do
  "hello"
  @question = Question.new(params[:question])
  if @question.save
    redirect '/'
  else
    "something fucked up"
    erb :errors
  end
end

get '/questions/:id' do
  "hello"
  erb :'questions/show'
end

delete '/questions/:id' do
  # write logic for deleting questions here.
end
