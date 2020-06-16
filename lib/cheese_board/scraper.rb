class CheeseBoard::Scraper

  def self.scrape_cheese_types
    doc = Nokogiri::HTML(open("https://www.castellocheese.com/en-us/cheese-types/"))
    doc.css("div.generic-overview-grid--no-scroll a.generic-card__link").map do |cheese_type|
      cheese_type.text
    end

    #return array of cheese type
  end

  def cheese_type_to_url(cheese_type)
    #takes in blue mold cheese to blue-mold-cheese/
  end

  def scrape_cheese_type_info_page(cheese_type_url)
    #return hash with propertyies
  end
end
