class Playlist

  attr_reader :name

  def initialize(name="Music")
    @name = name
    create_new_playlist @name unless exists?
  end

  def play
    tell_itunes_to_try "play playlist \"#{@name}\""
  end

  def self.playlists
    tell_itunes_to 'get the name of every playlist'
  end
  
  private

  def exists?
    tell_itunes_to('get the name of every playlist').include? @name
  end

  def create_new_playlist(name)
    tell_itunes_to "make new user playlist with properties {name:\"#{name}\"}"
  end

  def tell_itunes_to(what)
    `osascript -e 'tell app "iTunes" to #{what}'`
  end

  def tell_itunes_to_try(what)
    system("osascript -e 'tell app \"iTunes\" to #{what}'")
  end

end