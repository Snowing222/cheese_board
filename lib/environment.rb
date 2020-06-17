require "nokogiri"
require "pry"
require "open-uri"
require "colorize"
require 'colorized_string'

module CheeseBoard
  class Error < StandardError; end
  # Your code goes here...
end

require_relative "./cheese_board/version"
require_relative "./cheese_board/cli"
require_relative "./cheese_board/cheese"
require_relative "./cheese_board/scraper"
require_relative "./cheese_board/cheesetype"
