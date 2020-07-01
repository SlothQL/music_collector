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

artist2.first_name = 'Brandon Charles'
artist2.update()

artist3 = Artist.new( {
    'first_name' => 'Brody',
    'last_name' => 'Dalle'
})
artist3.save()

album1 = Album.new( {
    'title' => 'One by One',
    'genre' => 'Alternative rock',
    'artist_id' => artist1.id
})
album1.save()

album1.title = 'The Colour and the Shape'
album1.update()

album2 = Album.new( {
    'title' => 'Make yourself',
    'genre' => 'Pop rock',
    'artist_id' => artist2.id
})
album2.save()

album3 = Album.new( {
    'title' => 'Wasting Light',
    'genre' => 'Alternative rock',
    'artist_id' => artist1.id
})
album3.save()

artist3.delete()
album3.delete()

binding.pry
nil