require 'sinatra'
require 'sinatra/reloader' if development?

get '/' do
  greeting = "Hello, World!"
  erb :index, :locals => {:greeting => greeting}
end

get '/' do
  erb :index
end

get '/twss' do
  @title = "That's What She said!"
  erb :twss
end

get '/tnwss' do
  @title = "No she didn't!"
  erb :tnwss
end