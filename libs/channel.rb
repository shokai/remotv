class Channel

  def initialize(channel)
    @channel = channel.to_s
  end

  def self.parse(tv_or_remote_channel)
    if tv_or_remote_channel =~ /^tv_.+/
      return self.new tv_or_remote_channel.scan(/^tv_(.+)/)[0][0]
    elsif tv_or_remote_channel =~ /^remote_.+/
      return self.new tv_or_remote_channel.scan(/^remote_(.+)/)[0][0]
    end
    self.new tv_or_remote_channel
  end

  def to_tv
    "tv_#{@channel}"
  end

  def to_remote
    "remote_#{@channel}"
  end

  def to_s
    @channel
  end

end
