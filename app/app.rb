require 'sinatra/base'
require './lib/bookmark'
require './lib/comment'
require './lib/database_connection_setup'

class BookmarkManager < Sinatra::Base

  enable :method_override

  get '/bookmarks' do
    @bookmarks = Bookmark.all
    erb :'bookmarks/index'
  end

  get '/bookmarks/new' do
    erb :'bookmarks/new'
  end

  post '/bookmarks' do
    Bookmark.create(url: params[:url], title: params[:title])
    redirect '/bookmarks'
  end

  delete '/bookmarks/:id' do
    Bookmark.delete(id: params[:id])
    redirect '/bookmarks'
  end

  get '/bookmarks/:id' do
    @bookmark = Bookmark.find(id: params[:id])
    erb :'/bookmarks/show'
  end

  patch '/bookmarks/:id' do
    Bookmark.update(id: params[:id], url: params[:url], title: params[:title])
    redirect '/bookmarks'
  end

  get '/bookmarks/comment/:id' do
    @bookmark_id = params[:id]
    erb :'/bookmarks/comment'
  end

  post '/bookmarks/comment/:id' do
    Comment.create(text: params[:text], bookmark_id: params[:id])
    redirect '/bookmarks'
  end

  run! if app_file == $0
end
