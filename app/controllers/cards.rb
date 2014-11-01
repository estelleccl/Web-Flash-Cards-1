post '/cards/:id/answer' do
  if !login?
    redirect "/"
  else 
    @card  = Card.find(params[:id])
    @answer = Card.check_answer(params[:id], params[:answer1])
    guess = Guess.create(card_id: params[:id], round_id: session[:round].id)
    @round = Round.find(session[:round].id)
    @round.update(num_of_questions_left: @round.num_of_questions_left - 1)

    if @answer
      @answer = "Correct!! Bravo"
      guess.update(correct: "true")
    else
      @answer = "Wrong!!"
      guess.update(correct: "false")
      num_of_tries_left_count = @round.num_of_tries_left - 1
      @round.update(num_of_tries_left: num_of_tries_left_count)
    end
    if @round.num_of_tries_left <= 0
      erb :'round/lost'
    elsif @round.num_of_questions_left <= 0
      erb :'round/won'
    else
      erb :'cards/answer'
    end   
  end
end

get '/cards' do
   if !login?
      redirect "/"
   else
     user = User.find_by( username: session[:username] )
     @round = Round.where( user_id: user.id ).count
     deck = Deck.find_by( id: session[:round].deck_id )
     @card  = deck.cards.limit(1).order("RANDOM()")
     erb :'cards/show'
   end
end

get '/cards/answer' do
   if !login?
      redirect "/"
   end
end