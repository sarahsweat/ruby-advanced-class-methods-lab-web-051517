require "pry"

class Song
  attr_accessor :name, :artist_name
  @@all = []

  def self.create
    song = self.new
    song.name = name
    @@all << song
    song
  end

  def self.new_by_name(name)
    song = self.new
    song.name = name
    song
  end


  def self.create_by_name(name)
    song = self.new
    song.name = name
    @@all << song
    song
  end

  def self.find_by_name(name)
    @@all.detect {|songs| songs.name == name}
  end

  def self.find_or_create_by_name(name)
    exist = self.find_by_name(name)
    if exist != nil
      exist
    else
      self.create_by_name(name)
    end
  end

  def self.alphabetical
     self.all.sort_by { |s| s.name }

  end

  def self.new_from_filename(file_name)
    parsed = file_name.split(/ - /)
    artist = parsed[0]
    song_name = parsed[1].slice(0..-5)
    song = self.new
    song.name = song_name
    song.artist_name = artist
    song
  end

  def self.create_from_filename(file_name)
    parsed = file_name.split(/ - /)
    artist = parsed[0]
    song_name = parsed[1].slice(0..-5)
    song = self.new
    song.name = song_name
    song.artist_name = artist
    @@all << song
    song

  end

  def self.destroy_all
    @@all = []

  end

  def self.all
    @@all
  end

  def save
    self.class.all << self
  end

end
