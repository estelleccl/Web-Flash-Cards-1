post '/cards/:id/answer' do
  if !login?
    redirect "/"
  else 
    @card  = Card.find(params[:id])
    @answer = Card.check_answer(params[:id], params[:answer])
    round = Round.find_by(deck_id: @card.deck_id)
    if round.num_of_tries_left != 0
      if @answer
        Guess.create(card_id: params[:id],  correct: "true", round_id: session[:round].id)
      else
        Guess.create(card_id: params[:id],  correct: "false", round_id: session[:round].id)
        count = round.num_of_tries_left - 1
        puts "Here is tries #{round.num_of_tries_left.inspect}"
        puts "Here is count #{count.inspect}"
        round.update(num_of_tries_left: count.to_i)
      end
      erb :'cards/answer'
    else
      redirect "/"
    end
  end
end

get '/cards' do
   if !login?
      redirect "/"
   else
     deck = Deck.find_by(id: session[:round].deck_id)
     @card  = deck.cards.limit(1).order("RANDOM()")
     erb :'cards/show'
   end
end