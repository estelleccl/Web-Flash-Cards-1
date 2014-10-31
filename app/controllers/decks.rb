get '/decks' do 
  if !login?
    redirect "/"
  else
    deck = Deck.all
    erb :index
  end
end

get '/decks/:id' do
  if !login?
    redirect "/"
  else
    user = User.find_by(username: session[:username])
    deck = Deck.find(params[:id])
    round = Round.create(user_id: user.id, deck_id: deck.id, num_of_tries_left: 3)
    user.update(current_round: round.id)
    session[:round] = round
    redirect "/cards"
  end
end
    

