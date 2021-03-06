class Genre

 extend Concerns::Findable

  attr_accessor :name,:songs

  @@all = []

  def initialize(name)
    @name = name
    @songs = []
  end

  def self.all
    @@all
  end

  def self.destroy_all
    @@all = []
  end

  def save
    @@all << self
  end

  def self.create(name)
    genre = new(name)
    genre.save
    genre
  end
  def songs
    @songs
  end

  def add_song(song)
    if song.genre != self
    song.genre = self
    end
    if !(@songs.include?(song))
    @songs << song
    end
  end

  def artists
    # @songs.map do |song|
    #   song.artist
    # end
    self.songs.collect {|song| song.artist}.uniq
  end
end
