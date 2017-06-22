require "pry"

class Pokemon
  attr_accessor :id, :name, :type, :db, :hp

  def initialize(args)
    @id = args[:id]
    @name = args[:name]
    @type = args[:type]
    @db = args[:db]
    @hp = args[:hp]
  end

  def self.insert_query
    "INSERT INTO pokemon (name, type) VALUES (?, ?)"
  end

  def self.save(name, type, db)
    db.execute(self.insert_query, name, type)
  end

  def self.select_query
    "SELECT * FROM pokemon WHERE id = ?"
  end

  def self.find(id, db)
    vals = db.execute(self.select_query, id)[0]
    Pokemon.new({id: vals[0], name: vals[1], type: vals[2], hp: vals[3]})
  end

  def update_query
    "UPDATE pokemon SET hp = ? WHERE id = ?"
  end

  def alter_hp(hp, db)
    self.hp = hp
    db.execute(update_query, hp, self.id)
  end

end

# @db.execute("UPDATE weather SET datetime = ?, condition = ?, high = ?, low = ? WHERE datetime = ?", [1, 2, 3, 4, 5])
# # db.execute("SELECT * FROM pokemon WHERE level = ?", level)
