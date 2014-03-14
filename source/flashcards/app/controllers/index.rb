get '/' do
  erb :index
end

get '/decks' do
  @decks = Deck.all
  erb :all_decks
end

get '/decks/:id' do
  @deck = Deck.find(params[:id])
  @card = @deck.select_card
  erb :card
end

# get '/cards/:id' do
#   @card = Card.find(params[:id])
#   @user_answer = params[:answer]
#   if @answer_correct?
#     redirect "/decks/:id"
#   else
#     erb :card
#   end
# end

#shows note page
get '/notes/:id' do
  @note = Note.find(params[:id])
  @note_page = true
  erb :index
end

#creates new note from form on index
post '/notes' do
  @note = Note.create(params)
  redirect "/notes/#{@note.id}"
end

#shows update/delete form
get '/notes/:id/edit' do
  @note = Note.find(params[:id])
  @edit_note = true
  erb :index
end


#update database!
put '/notes/:id' do
  p params
  @note = Note.find(params[:id])
  @note.update_attributes(title: params[:title], content: params[:content])
  redirect "/notes/#{@note.id}"
end

#verify deletion
get '/notes/:id/verify_deletion' do
  @note = Note.find(params[:id])
  @verify = true
  erb :index
end

#delete the post from database
delete '/notes/:id' do
  @note = Note.find(params[:id])
  @note.destroy
  redirect "/"
end