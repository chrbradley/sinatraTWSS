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

__END__
@@layout
<html>
  <head>
    <title><%= @title || "Is That What She Said?" %></title>
  </head>
  <body>
    <form action="/" class="form-inline" method="POST">
      <input type="text" placeholder="What did she say?" name="content">
      <button type="submit" class="btn">Did She?</button>
    </form>
      <%= yield %>
  </body>
</html>

@@index
<h1><%= @title %></h1>