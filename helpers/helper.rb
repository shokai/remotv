helpers do
  def app_name
    "remotv"
  end

  def app_root
    "#{env['rack.url_scheme']}://#{env['HTTP_HOST']}#{env['SCRIPT_NAME']}"
  end

  def channels
    Sinatra::RocketIO.channels.values.uniq.map{|i|
      Channel.parse(i).to_s
    }.uniq.sort
  end
end
