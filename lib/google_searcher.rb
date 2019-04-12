require 'pry'
require 'launchy'

Launchy.open("http://stackoverflow.com")
def check_if_user_gave_input
  abort("Missing arguments for search: type google_searcher looking_for_something\ngoogle_searcher: missing input") if ARGV.empty?
end

def get_string_search
  return str_search = ARGV.first
end

def launch_search(str_search)
  Launchy.open("https://www.google.com/search?q=#{str_search.gsub(/ /, '+')}")
end

def perform
  check_if_user_gave_input
  #p get_string_search
  launch_search(get_string_search)
end

perform
