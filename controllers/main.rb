io = Sinatra::RocketIO

io.on :connect do |client|
  puts "new client <#{client}>"
end

io.on :go do |data, client|
  puts "go #{data['url']}  <#{client}>"
  push :go, data, :channel => Channel.parse(client.channel).to_tv
end

io.on :scroll do |data, client|
  puts "scroll #{data} <#{client}>"
  push :scroll, data, :channel => Channel.parse(client.channel).to_tv
end

get '/' do
  @title = app_name
  haml :index
end

get '/tv/:channel' do
  @channel = Channel.new params[:channel]
  @title = "#{app_name} tv ch:#{@channel}"
  haml :tv, :layout => false
end

get '/remote/:channel' do
  @channel = Channel.new params[:channel]
  @title = "#{app_name} remote ch:#{@channel}"
  haml :remote
end
