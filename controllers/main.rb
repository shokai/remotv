io = Sinatra::RocketIO
cache = TmpCache::Cache.new
expire = 60*60

io.on :connect do |client|
  channel = Channel.parse client.channel
  puts "new client <#{client}>"
  data = cache.get channel.to_s
  if data
    push :go, data, :to => client.session
  end
end

io.on :go do |url, client|
  channel = Channel.parse client.channel
  puts "go #{url}  <#{client}>"
  data = {:url => url, :left => 0, :top => 0}
  cache.set channel.to_s, data, expire
  push :go, data, :channel => channel.to_tv
end

io.on :scroll do |scroll, client|
  channel = Channel.parse client.channel
  puts "scroll #{scroll} <#{client}>"
  data = cache.get channel.to_s
  data[:left] += scroll['x'].to_i
  data[:left] = 0 if data[:left] < 0
  data[:top] += scroll['y'].to_i
  data[:top] = 0 if data[:top] < 0
  cache.set channel.to_s, data, expire
  push :scroll, data, :channel => channel.to_tv
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
