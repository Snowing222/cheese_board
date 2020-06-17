class CheeseBoard::CLI
  def call
    puts "\nWelcome to Cheese Board! Are you ready to explore the CHEEZZZYY-WORLD?"
    get_cheese_types
    list_cheese_types
    get_user_cheese_type
    get_user_cheese
    #get_cheese_for(cheese_type)
    #list cheeses

  end

  def get_cheese_types
    @cheese_types=CheeseBoard::CheeseType.all
  end

  def list_cheese_types
    puts "\nWhat type of cheese are you interested in. Please enter number of the cheese, or exit"
    @cheese_types.each.with_index(1) do |cheese_type, index|
      puts "#{index}. #{cheese_type.name}"
    end
  end

  def get_user_cheese_type
    input = gets.strip
    if input != "exit"
      show_cheese_type_for(input.to_i) if valid_input?(input, @cheese_types)
    else
      say_good_bye
    end
  end

  def valid_input?(input,array)
    input.to_i > 0 && input.to_i <= array.length
  end

  def say_good_bye
    puts "See you next time!"
  end

  def show_cheese_type_for(chosen_cheese_type)
    @cheese_type=@cheese_types[chosen_cheese_type-1]
    @cheese_type.get_cheeses
    puts "Here are the information for #{@cheese_type.name}"
    puts "Enter a number for the cheese you are interested in, 'back; to go back, or exit"
    @cheese_type.cheeses.each.with_index(1) do |cheese,index|
      puts "#{index}. #{cheese.name}"
    end
  end

  def get_user_cheese
    input = gets.strip
    case input
    when "exit"
      say_good_bye
    when "back"
      list_cheese_types
      get_user_cheese_type
    else
      show_cheese_for(input.to_i) if valid_input?(input, @cheese_type.cheeses)
    end
  end

  def show_cheese_for(chosen_cheese)
    puts "here is the info"
    puts "#{chosen_cheese.cheese_description}"
    puts "#{chosen_cheese.pair_wine}"
  end

end
