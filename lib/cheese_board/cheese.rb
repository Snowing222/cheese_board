class CheeseBoard::Cheese
  @@all=[]
  attr_accessor :name, :description, :cheesetype

  def initialize(name, cheesetype)
    @name=name
    @cheesetype=cheesetype
    add_to_cheesetype
    save
  end

  def self.all
    @@all
  end

  def save
    @@all << self
  end

  def add_to_cheesetype
    @cheesetype.cheeses << self unless @cheesetype.cheeses.include?(self)
  end

end
