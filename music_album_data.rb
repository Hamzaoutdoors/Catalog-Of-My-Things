require 'json'
require_relative 'music_album'

module MusicAlbumStorage
  def save_music_albums
    @json_music_albums = []
    @music_albums.each do |music_album|
      @json_music_albums.push({ 'id' => music_album.id, 'name' => music_album.name, 'publish_date' => music_album.publish_date,
                                'on_spotify' => music_album.on_spotify })
    end
    File.write('music_album.json', JSON.pretty_generate(@json_music_albums))
  end

  def parse_music_albums
    unless File.exist?('music_album.json')
      File.open('music_album.json', 'w') do |f|
        f.write JSON.pretty_generate([])
      end
    end
    JSON.parse(File.read('music_album.json')).map do |music_album|
      created_music_album = MusicAlbum.new(music_album['name'], music_album['publish_date'], music_album['on_spotify'])
      @music_albums << created_music_album
    end
  end
end
