get '/result' do
  if !login?
    redirect "/" 
  else
    user = User.find_by( username: session[:username] )
    @total_num_of_rounds = Round.where( user_id: user.id ).order('id desc').count
    @rounds = Round.where( user_id: user.id ).order('id desc').take(6)
    erb :result
  end
end

get '/results/all' do
  if !login?
    redirect "/" 
  else
    user = User.find_by( username: session[:username] )
    @total_num_of_rounds = Round.where( user_id: user.id ).order('id desc').count
    @rounds = Round.where( user_id: user.id ).order('id desc')
    erb :result
  end
end

get '/round/lost' do
   if !login?
      redirect "/"
   end
end

get '/round/won' do
   if !login?
      redirect "/"
   end
end