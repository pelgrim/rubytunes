$:.unshift '../lib'
require 'playlist'

describe Playlist, "#new" do
  
  it "returns 'Music' playlist by default" do
    playlist = Playlist.new
    playlist.name.should eq "Music"
  end

  it "can use another playlist name" do
    playlist = Playlist.new("rubytunes")
    playlist.name.should eq "rubytunes"
  end

end