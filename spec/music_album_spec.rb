require_relative '../music_album'

RSpec.describe MusicAlbum do
  before :each do
    @music_album = [MusicAlbum.new('Godzilla', '2010-11-22', true), MusicAlbum.new('Left side', '2021-10-22', true)]
  end

  it 'check if MusicAlbum is kind of Item' do
    @music_album.each do |album|
      expect(album).to be_kind_of Item
    end
  end

  it 'is an instance of the class?' do
    @music_album.each do |album|
      expect(album).to be_instance_of MusicAlbum
    end
  end

  it 'check if the album can be archived' do
    can_be_archived = @music_album[0].send(:can_be_archived?)
    expect(can_be_archived).to be true
  end

  it 'check if the album can not be archived' do
    can_be_archived = @music_album[1].send(:can_be_archived?)
    expect(can_be_archived).to be false
  end
end
