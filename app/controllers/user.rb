get '/users/:id/vote' do

  redirect "/users"
end

delete '/users/:id' do
  # write logic for deleting users here.
end

get '/users/new' do
	erb :'/users/register'
end

post '/user' do
  new_user = User.create(username: params[:username], password: params[:password])
  session[:user_id] = new_user.id
  redirect "/users/#{new_user.id}"
end

get '/users/:id' do
  @user = User.find(params[:id])
  @user_questions = @user.questions
  erb :'users/show'
end
