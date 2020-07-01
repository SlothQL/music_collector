require_relative('../db/sql_runner')
require_relative('album')

class Artist

    attr_reader :id
    attr_accessor :first_name, :last_name 

    def initialize(options)
        @id = options['id'].to_i() if options['id']
        @first_name = options['first_name']
        @last_name = options['last_name']
    end

    def save()
        sql = "INSERT INTO artists
        (first_name, last_name)
        VALUES ($1, $2) RETURNING id"
        values = [@first_name, @last_name]
        result = SqlRunner.run(sql, values)
        @id = result[0]['id'].to_i()
    end

    def self.delete_all()
        sql = "DELETE FROM artists"
        SqlRunner.run(sql)
    end

    def self.all()
        sql = "SELECT * FROM artists"
        result = SqlRunner.run(sql)
        return result.map { |object| Artist.new(object) }
    end

    def albums()
        sql = "SELECT * FROM albums WHERE artist_id = $1"
        values = [@id]
        result = SqlRunner.run(sql, values)
        all_albums = result.map { |object| Album.new(object) }
        return all_albums
    end

    def update()
        sql = "UPDATE artists
        SET(first_name, last_name) = ($1, $2)
        WHERE id = $3"
        values = [@first_name,@last_name, @id]
        SqlRunner.run(sql, values)
    end

end