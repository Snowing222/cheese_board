class CheeseBoard::CheeseType
  @@all=[]
  attr_accessor :name, :description, :cheeses

  def initialize(name)
    @name=name
    @cheeses=[]
    save
  end

  def self.all
    CheeseBoard::Scraper.scrape_cheese_types if @@all.empty?
    @@all
  end

  def get_cheeses
    CheeseBoard::Scraper.scrape_cheeses(self) if @cheeses.empty?
  end

  def save
    @@all << self
  end

  def count
    @cheese.length
  end

end
