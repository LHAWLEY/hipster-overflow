enable :sessions

get '/' do
	erb :index
end

get '/login' do
	erb :login
end

post '/login' do
	user = User.find_by(username: params[:username])
	if user != nil && user.authenticate(params[:password])
		session[:user_id] = user.id
		session[:needs_error]= false
		redirect "/users/#{user.id}"
	else
		erb :login
	end
end

get '/logout' do
	session[:user_id] = nil
	redirect '/'
end
