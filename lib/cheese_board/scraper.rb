class CheeseBoard::Scraper
  BASEPATH = "https://www.castellocheese.com/en-us/cheese-types/"
  @@url = ""
  @@cheese_type = ""

  def self.scrape_cheese_types
    doc = Nokogiri::HTML(open(BASEPATH))
    cheese_types = doc.css("div.generic-overview-grid--no-scroll a.generic-card__link")
    cheese_types.map do |cheese_type|
      name = cheese_type.text
      CheeseBoard::CheeseType.new(name)
    end
  end

  def self.scrape_cheeses(cheese_type)
    @@cheese_type=cheese_type
    @@url = BASEPATH + @@cheese_type.name.gsub(" ","-") + "/"
    doc = Nokogiri::HTML(open(@@url))
    heads = doc.css("div.cheese-category__inner.row-container h4")
    cheese_type.char=heads.shift.text
    heads.each.with_index do |h|
      name = h.text
      CheeseBoard::Cheese.new(name, cheese_type)
    end
  end

  def self.scrape_cheese_descriptions
    doc = Nokogiri::HTML(open(@@url))
    description_count=@@cheese_type.cheeses.count*2
    descriptions = doc.css("div.cheese-category__inner.row-container p")
    t=descriptions.map {|x| x.text}.last(description_count)
    c_d=t.select.with_index(1) {|_,i| i.odd?}
    p_w=t.select.with_index(1) {|_,i| i.even?}
    @@cheese_type.cheeses.zip(c_d , p_w).each do |cheese,c_des,p_des|
      cheese.cheese_description=c_des
      cheese.pair_wine=p_des
    end

  end
end
