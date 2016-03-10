helpers do
  def current_user
    User.find(session[:user_id]) if session[:user_id]
  end

  def logged_in?
    session[:user_id]
  end

  def redirect_login
    if !logged_in?
      redirect '/user/new'
    end
  end
end
