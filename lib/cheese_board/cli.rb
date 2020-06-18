class CheeseBoard::CLI
  def call
    puts "\nWelcome to Cheese Board! Are you ready to explore the CHEEZZZYY-WORLD?".colorize(:yellow)
    run

  end
#current position=top,cheese_type, cheese,
#when back => what index currently at -1, grab the position, run the method

  def run
    list_cheese_types
    get_user_cheese_type
    get_user_cheese
  end

  def list_cheese_types
    @cheese_types=get_cheese_types
    puts "\nWhat type of cheese are you interested in. Please enter number of the cheese, or #{ColorizedString["exit"].colorize(:red)}"
    print_list(@cheese_types)
  end

  def get_cheese_types
    CheeseBoard::CheeseType.all
  end

  def print_list(array)
    array.each.with_index(1) do |value, index|
      puts "#{index}. #{value.name}"
    end
  end

  def valid_input?(input,array)
    input.to_i > 0 && input.to_i <= array.length
  end

  def get_user_cheese_type
    puts ""
    input = gets.strip
    puts ""
    sleep 1
    if input=="exit"
      say_good_bye
    elsif valid_input?(input, @cheese_types)
      show_cheese_type_for(input.to_i)
    else
      puts "I dont understand, please try again"
      get_user_cheese_type
    end
  end

  def show_cheese_type_for(chosen_cheese_type)
    @cheese_type=@cheese_types[chosen_cheese_type-1]
    @cheese_type.get_cheeses
    puts "Here are the information for #{@cheese_type.name}"
    puts "\n#{@cheese_type.char}".colorize(:blue)
    puts "\nEnter a number for the cheese you are interested in, #{ColorizedString["back"].colorize(:red)} to discover more, or #{ColorizedString["exit"].colorize(:red)}"
    print_list(@cheese_type.cheeses)
  end

  def get_user_cheese
    puts ""
    input = gets.strip
    puts ""
    sleep 1

    if input=="exit"
      say_good_bye
    elsif input=="back"
      run
    elsif valid_input?(input, @cheese_type.cheeses)
      show_cheese_for(input.to_i)
    else
      puts "I dont understand, please try again"
      get_user_cheese_type
    end
  end

  def show_cheese_for(chosen_cheese)
    cheese = @cheese_type.cheeses[chosen_cheese-1]
    cheese.get_cheese_description
    puts "CHARACTERISTICS".colorize(:blue)
    puts "#{cheese.cheese_description}"
    puts ""
    puts "BEST MATE".colorize(:blue)
    puts "#{cheese.pair_wine}"
    puts "\nEnter #{ColorizedString["back"].colorize(:red)} to discover more cheeses, or #{ColorizedString["exit"].colorize(:red)}"
    get_user_cheese
 end

 def say_good_bye
   puts "See you next time!".colorize(:yellow)
   exit
 end

end
