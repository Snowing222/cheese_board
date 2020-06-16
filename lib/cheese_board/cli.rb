class CheeseBoard::CLI
  def call
    puts "Welcome to Cheese_board! Are you ready to explore the CHEEZZZYY-WORLD?"
    puts ""
    get_list_of_cheese_type
    get_user_cheese_type
    #get_cheese_for(cheese_type)
    #list cheeses
  end

  def get_list_of_cheese_type
    #to be scraped instead
    @cheese_types=["hard cheese", "soft cheese" ,"fresh cheese", "goat cheese"]
  end

  def get_user_cheese_type
    #list cheese type
    @cheese_types.each.with_index(1) do |cheese_type, index|
      puts "#{index}. #{cheese_type}"
    end
  end
end
