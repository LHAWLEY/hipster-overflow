post '/comments' do
  current_user.comments.create(params[:comment])

  redirect '/' # replace with json
end

delete '/comments/:id' do
  comment = current_user.comments.find_by(id: params[:id])
  comment.destroy

  redirect '/' # replace with json
end






