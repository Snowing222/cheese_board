require "nokogiri"
require "pry"

module CheeseBoard
  class Error < StandardError; end
  # Your code goes here...
end

require_relative "./cheese_board/version"
require_relative "./cheese_board/cli"
require_relative "./cheese_board/cheese"
require_relative "./cheese_board/scraper"
