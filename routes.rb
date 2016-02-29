require "sinatra"

#Root route
get '/' do
  erb :menu
end

get '/command-line' do
@commands = ["cp","ls","mkdir","touch","mv"]
  erb :command_line
end

get '/man' do
  com = params[:command]
  @man_page = `man #{com}`
  erb :man
end

get '/google' do
  redirect("http://google.com")
end

get '/search' do
  erb :search
end

post '/search' do
  res = params[:result]
  @man_page = `man #{res}`
  erb :search_result
end

not_found do
  status 404
  "not found"
end