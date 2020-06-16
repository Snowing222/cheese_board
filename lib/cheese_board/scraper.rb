class CheeseBoard::Scraper
  BASEPATH="https://www.castellocheese.com/en-us/cheese-types/"
  def self.scrape_cheese_types
    doc = Nokogiri::HTML(open(BASEPATH))
    cheese_types=doc.css("div.generic-overview-grid--no-scroll a.generic-card__link")
    cheese_types.map do |cheese_type|
      name=cheese_type.text
      CheeseBoard::CheeseType.new(name)
    end
  end

  def self.scrape_cheeses(cheese_type)
    url=BASEPATH + cheese_type.name.gsub(" ","-") + "/"
    doc = Nokogiri::HTML(open(url))
    heads=doc.css("div.cheese-category__inner.row-container h4")
    heads.shift
    heads.each.with_index do |h|
      name=h.text
      CheeseBoard::Cheese.new(name,cheese_type)
    end
  end

end
