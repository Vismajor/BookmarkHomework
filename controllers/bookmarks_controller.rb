get '/bookmarks' do

  # We have user input in params[:search]
  # Use input to seacrh table 

  if params[:genre]
    @bookmarks = Bookmark.find_genre(params[:genre])
  else
    @bookmarks = Bookmark.all
  end

  erb :'bookmarks/index'
end

get'/bookmarks/new' do
  @bookmark = Bookmark.new
  erb :'bookmarks/new'
end

post '/bookmarks' do
 @bookmark = Bookmark.new(params[:bookmark])
 @bookmark.save
 redirect to('/bookmarks')
end

post '/bookmarks/:id/delete' do
  Bookmark.find(params[:id]).destroy
  redirect to ('/bookmarks')
end

get '/bookmarks/:id/edit' do
  @bookmark = Bookmark.find(params[:id])
  erb :'bookmarks/edit'
end

post '/bookmarks/:id' do
  @bookmark = Bookmark.find(params[:id])
  @bookmark.update_attributes(params[:bookmark])
  redirect to("/bookmarks")
end
