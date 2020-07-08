class CheeseBoard::Cheese
  attr_accessor :name, :cheesetype, :cheese_description, :pair_wine

  def initialize(name, cheesetype)
    @name = name
    @cheesetype = cheesetype
    add_to_cheesetype
  end

  def add_to_cheesetype
    @cheesetype.cheeses << self
  end

end
