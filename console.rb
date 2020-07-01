require('pry-byebug')
require_relative('models/artist')
require_relative('models/album')

Album.delete_all()
Artist.delete_all()

artist1 = Artist.new( {
    'first_name' => 'Dave',
    'last_name' => 'Grohl'
})
artist1.save()

artist2 = Artist.new( {
    'first_name' => 'Brandon',
    'last_name' => 'Boyd'
})
artist2.save()

album1 = Album.new( {
    'title' => 'One by One',
    'genre' => 'Alternative rock',
    'artist_id' => artist1.id
})

album1.save()

binding.pry
nil