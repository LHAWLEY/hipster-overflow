enable :sessions

get '/' do
  @questions = Question.all.sample(10)
	erb :index
end

get '/users/login' do
	erb :'users/login'
end

post '/users/login' do
  user = User.find_by(username: params[:username])
  if user && user.authenticate(params[:password])
    session[:user_id] = user.id
    redirect "/users/#{user.id}"
  else
    @errors = ["Incorrect Username/Password"]
    erb :'users/login'
  end
end

get '/logout' do
	session[:user_id] = nil
	redirect '/'
end
