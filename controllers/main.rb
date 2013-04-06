io = Sinatra::RocketIO
cache = TmpCache::Cache.new

io.on :connect do |client|
  channel = Channel.parse client.channel
  puts "new client <#{client}>"
  data = cache.get(channel.to_s)
  if data
    push :go, data, :to => client.session
  end
end

io.on :go do |url, client|
  channel = Channel.parse client.channel
  puts "go #{url}  <#{client}>"
  data = {:url => url, :x => 0, :y => 0}
  cache.set(channel.to_s, data, 60)
  push :go, data, :channel => channel.to_tv
end

io.on :scroll_x do |x, client|
  channel = Channel.parse client.channel
  puts "scroll_x #{x} <#{client}>"
  push :scroll_x, x, :channel => channel.to_tv
end

io.on :scroll_y do |y, client|
  channel = Channel.parse client.channel
  puts "scroll_y #{y} <#{client}>"
  push :scroll_y, y, :channel => channel.to_tv
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
