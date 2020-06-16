class CheeseBoard::CheeseType
  @@all=[]
  attr_accessor :name, :description, :cheese

  def initialize(name)
    @name=name
    @cheeses=[]
    save
  end

  def self.all
    CheeseBoard::Scraper.scrape_cheese_types if @@all.empty?
    @@all
  end

  def cheeses
    binding.pry
    CheeseBoard::Scraper.scrape_cheeses(self) if @cheeses.empty?
    @cheeses
  end

  def save
    @@all << self
  end

end
