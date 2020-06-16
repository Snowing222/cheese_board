class CheeseBoard::Cheese
  @@all=[]
  attr_accessor :name, :description, :type

  def initialize(name)
    @name=name
    save
  end

  def save
    @@all << self
  end

end
