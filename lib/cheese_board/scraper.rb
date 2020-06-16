class CheeseBoard::Scraper

  def self.scrape_cheese_types
    doc = Nokogiri::HTML(open("https://www.castellocheese.com/en-us/cheese-types/"))
    cheese_types=doc.css("div.generic-overview-grid--no-scroll a.generic-card__link")
    cheese_types.map do |cheese_type|
      name=cheese_type.text
      CheeseBoard::CheeseType.new(name)
    end

    #return array of cheese type
  end

  def cheese_type_to_url(cheese_type)
    #takes in blue mold cheese to blue-mold-cheese/
  end

  def self.scrape_cheeses(cheese_type)
    CheeseBoard::Cheese.new("abc",cheese_type)
    CheeseBoard::Cheese.new("def",cheese_type)
  end
end
