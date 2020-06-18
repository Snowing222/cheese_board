class CheeseBoard::Cheese
  @@all=[]
  attr_accessor :name, :pair_wine, :cheesetype, :cheese_description

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
    @cheesetype.cheeses << self
  end

  def get_cheese_description
    CheeseBoard::Scraper.scrape_cheese_description if !(@pair_wine && @cheese_description)
  end

end
