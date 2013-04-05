io = Sinatra::RocketIO
cache = TmpCache::Cache.new

io.on :connect do |client|
  channel = Channel.parse client.channel
  puts "new client <#{client}>"
  data = cache.get(channel.to_s)
  push :go, data, :to => client.session if data
end

io.on :go do |data, client|
  channel = Channel.parse client.channel
  puts "go #{data['url']}  <#{client}>"
  cache.set(channel.to_s, data, 60)
  push :go, data, :channel => channel.to_tv
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
