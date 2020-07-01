require('pry-byebug')
require_relative('models/artist')

Artist.delete_all()

artist1 = Artist.new( {
    'first_name' => 'Dave',
    'last_name' => 'Grohl'
})
artist1.save()

binding.pry
nil