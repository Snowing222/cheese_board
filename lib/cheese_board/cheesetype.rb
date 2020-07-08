class CheeseBoard::CheeseType
  @@all=[]
  attr_accessor :name, :char, :cheeses

  def initialize(name)
    @name=name
    @cheeses=[]
    save
  end

  def self.all
    CheeseBoard::Scraper.scrape_cheese_types if @@all.empty?
    @@all
    
  end

  # def self.cheesetype_name
  #   @@all.map do |cheese_type|
  #     cheese_type.name
  #   end
  # end

  # def self.sorted
  #   @@all.sort_by {|c| c.name}
  # end

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
