class CheeseBoard::CheeseType
  @@all=[]
  attr_accessor :name, :description, :char

  def initialize(name)
    @name=name
    save
  end

  def self.all
    CheeseBoard::Scraper.scrape_cheese_types if @@all.empty?
    @@all
  end

  def save
    @@all << self
  end

end
