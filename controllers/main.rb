io = Sinatra::RocketIO

io.on :connect do |client|
  puts "new client <#{client.session}>"
end

io.on :go do |data, client|
  puts "go #{data['url']}  <#{client}>"
  push :go, data
end

io.on :scroll do |data, client|
  puts "scroll #{data}"
  push :scroll, data
end

get '/' do
  @title = app_name
  haml :index
end

get '/tv' do
  @title = "#{app_name} tv"
  @url = params[:url]
  haml :tv, :layout => false
end

get '/con' do
  @title = app_name
  haml :con
end
