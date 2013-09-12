require 'sinatra'
require 'sinatra/reloader' if development?
require 'rubygems'
require 'twss'

get '/' do
  @title = "What did she say?"
  erb :index
end

post '/' do
  if TWSS(params[:content])
    @title = "That's What She Said!"
  else
    @title = "She did NOT say that."
  end
  erb :index
end