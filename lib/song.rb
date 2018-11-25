require 'pry'
class Song
  
  attr_accessor :name, :artist_name
  @@all = []

  def self.all
    @@all
  end

  def save
    self.class.all << self
  end

  def self.create
  new_song = Song.new
  	new_song.save
  return new_song	
  end

  def self.new_by_name(name)
  new_song= Song.create 
  new_song.name = name
  return new_song
  end

  def self.create_by_name(name)
  	Song.new_by_name(name)
  
  end

  def self.find_by_name(song_name)
  	target = []
  	Song.all.select do |song|
  	if song.name == song_name
  		target = song
  	end
  	end	
  	if target == []
  	 return nil
  	 else return target		 
  	end 
  end

  def self.find_or_create_by_name(song_name)
  	song1 = Song.find_by_name(song_name)
   	
   	if song1.class == Song
   		return song1
   	else
   		Song.create_by_name(song_name)
	end
  end

  def self.alphabetical 
  	Song.all.sort_by {|song| song.name}
  end

  def self.new_from_filename(file)
	split_file = file.split(' - ')
	artist = split_file[0]
	title = split_file[1].chomp('.mp3')
	new_song = Song.create_by_name(title)
	new_song.artist_name = artist
	return new_song
	end

  def self.create_from_filename(file)
  	Song.new_from_filename(file)
  end

  def self.destroy_all
  	self.all.clear
  end

end#end of class definition
