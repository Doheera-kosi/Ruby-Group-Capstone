require_relative '../classes/music_album'

describe MusicAlbum do
  context 'Testing the MusicAlbum class instantiation' do
    it 'Should be of the instance of MovieAlbum' do
      music_album = MusicAlbum.new('1997-09-05', false)
      expect(music_album).to be_instance_of MusicAlbum
    end

    it 'Should return if the music album can be moved to the archive' do
      album = MusicAlbum.new('2012-12-12', false)
      expect(album.move_to_archive).to eq nil
    end
  end
end
