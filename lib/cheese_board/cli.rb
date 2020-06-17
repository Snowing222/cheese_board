class CheeseBoard::CLI
  def call
    puts "\nWelcome to Cheese Board! Are you ready to explore the CHEEZZZYY-WORLD?".colorize(:yellow)
    list_cheese_types
    get_user_cheese_type
    get_user_cheese
  end

  def list_cheese_types
    get_cheese_types
    puts "\nWhat type of cheese are you interested in. Please enter number of the cheese, or #{ColorizedString["exit"].colorize(:red)}"
    @cheese_types.each.with_index(1) do |cheese_type, index|
      puts "#{index}. #{cheese_type.name}"
    end
  end

  def get_cheese_types
    @cheese_types=CheeseBoard::CheeseType.all
  end

  def get_user_cheese_type
    puts ""
    input = gets.strip
    puts ""
    sleep 1
    if input != "exit"
      show_cheese_type_for(input.to_i) if valid_input?(input, @cheese_types)
    else
      say_good_bye
    end
  end

  def valid_input?(input,array)
    input.to_i > 0 && input.to_i <= array.length
  end

  def show_cheese_type_for(chosen_cheese_type)
    @cheese_type=@cheese_types[chosen_cheese_type-1]
    @cheese_type.get_cheeses
    puts "Here are the information for #{@cheese_type.name}"
    puts "\nIt's #{@cheese_type.char}"
    puts "\nEnter a number for the cheese you are interested in, #{ColorizedString["back"].colorize(:red)} to discover more, or #{ColorizedString["exit"].colorize(:red)}"
    @cheese_type.cheeses.each.with_index(1) do |cheese,index|
      puts "#{index}. #{cheese.name}"
    end
  end

  def get_user_cheese
    puts ""
    input = gets.strip
    puts ""
    sleep 1
    case input
    when "exit"
      say_good_bye
    when "back"
      list_cheese_types
      get_user_cheese_type
      get_user_cheese
    else
      show_cheese_for(input.to_i) if valid_input?(input, @cheese_type.cheeses)
    end
  end

  def show_cheese_for(chosen_cheese)
    cheese = @cheese_type.cheeses[chosen_cheese-1]
    CheeseBoard::Scraper.scrape_cheese_descriptions
    puts "#{cheese.cheese_description}"
    puts "\n#{cheese.pair_wine}"
    puts "\nEnter #{ColorizedString["back"].colorize(:red)} to discover more cheeses, or #{ColorizedString["exit"].colorize(:red)}"
    get_user_cheese
 end

 def say_good_bye
   puts "See you next time!".colorize(:yellow)
   exit!
 end

end
