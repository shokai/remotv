CometIO.on :connect do |session|
  puts "new client <#{session}>"
end

CometIO.on :go do |data, from|
  puts "go #{data['url']}  (from:#{from})"
  self.push :go, data
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
