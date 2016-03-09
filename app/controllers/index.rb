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
		redirect "/user/#{user.id}"
	else
		erb :login
	end
end

get '/logout' do
	session[:user_id] = nil
	redirect '/'
end


=begin
get '/' do
  redirect '/posts'
end

get '/posts' do
  erb :index
end

get '/posts/:id/vote' do

  redirect "/posts"
end

delete '/posts/:id' do
  # write logic for deleting posts here.
end

post '/posts' do

  redirect '/posts'
end

get '/post/:id' do

  erb :post
end
=end
