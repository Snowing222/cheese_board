class CheeseBoard::CLI
  def call
    puts "\nWelcome to Cheese_board! Are you ready to explore the CHEEZZZYY-WORLD?"
    get_cheese_types
    list_cheese_types
    get_user_cheese_type
    #get_cheese_for(cheese_type)
    #list cheeses

  end

  def get_cheese_types
    #to be scraped instead
    @cheese_types=CheeseBoard::CheeseType.all
  end

  def list_cheese_types
    #list cheese type
    puts "\nWhat type of cheese do you are you interested in. Please enter number of the cheese, or exit"
    @cheese_types.each.with_index(1) do |cheese_type, index|
      puts "#{index}. #{cheese_type.name}"
    end
  end

  def get_user_cheese_type
    chosen_cheese_type=gets.strip.to_i
    show_cheese_type_for(chosen_cheese_type)if valid_input?(chosen_cheese_type, @cheese_types)

  end

  def valid_input?(input,array)
    input.to_i > 0 && input.to_i <= array.length
  end

  def show_cheese_type_for(chosen_cheese_type)
    cheese_type=@cheese_types[chosen_cheese_type-1]
    puts "Here are the information for #{cheese_type}"

    # CheeseBoard::Cheese.all.each.with_index(1) do |cheese|
    #   puts "#{cheese.name}"
    # end
    #
    # get_cheese_info_for(chosen_cheese)
  end

end
