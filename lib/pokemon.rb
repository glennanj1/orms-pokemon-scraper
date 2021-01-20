require 'pry'

class Pokemon

    attr_accessor :name, :type, :db
    attr_reader :id

    def initialize(id:, name:, type:, db:)
        @id = id
        @name = name
        @type = type
        @db = db
    end


    def self.save(name, type, db)
        db.execute("insert into pokemon (name, type) values (?, ?)", name, type)
    end


    def self.find(id_number, db)
        pokemon = db.execute("select * from pokemon where id = ?", id_number).flatten
        Pokemon.new(id: pokemon[0], name: pokemon[1], type: pokemon[2], db: db)
        
    end
end
