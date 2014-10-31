get '/' do
 @decks = Deck.all
 erb :index
end

get '/result' do
  if !login?
    redirect "/" 
  else
    user = User.find_by( username: session[:username] )
    @rounds = Round.where( user_id: user.id )
    erb :result
  end
end