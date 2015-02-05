# To Do: rescue exception implementieren http://www.tutorialspoint.com/ruby/ruby_exceptions.htm
require 'rubygems'
require 'nokogiri'   
require 'open-uri'
require 'Clipboard'
require 'colorize'
require_relative 'warm_welcome.rb'
load 'search_word.rb'

# Methods

def default_settings 
  @sprache = "e"
  @array = []
end

def lenguage
  @hash = { "e" => "english", "s" => "spanish", "f" => "french" }
  puts  "lenguage is set to: #{@hash[@sprache].red}"
end

def register
  if @array.empty?
    @content = "no entrys yet".red
  else
    @content = @array
  end
  puts  "Bisherige Vokabeln: #{@content}"
end

def main_menue
  puts `clear`# clears bash
  puts  '######  Leo-Mp3 Finder #######  Main Meue #######'
  puts  "\nPress: 1 for: Welcome 2 for: Changing Languages 3 for:  Searching a Word 4 for: Exiting"
  puts
  puts "#{lenguage}\n#{register}"
  @choice = gets.chomp!.to_i 
  return @choice # wahrscheinlich redundant
end

def select_language 
  begin
    puts `clear`# clears bash
    puts  '######  Leo-Mp3 Finder #######  Select Language  #######'
    puts  "\nPress: e for: English s for: Spanish f for: French 4 for: Exiting"
    puts
    puts "#{lenguage}\n#{register}"
    @sprache = gets.chomp!
    puts `clear`# clears bash
  end until @sprache == "e" || @sprache == "s" || @sprache == "f"
end
def select_word 
  begin
    puts `clear`# clears bash
    puts  '######  Leo-Mp3 Finder #######  Search a Word #######'
    puts  "\nWhich Word Are You Looking For ? #### Press => m for Main Menue #####"
    puts
    puts "#{lenguage}\n#{register}"
    print "\nword =>  "; @begriff = gets.chomp!
    if @begriff.downcase != "m"
      @array << @begriff
      # the search_word class !!!
      finder = SearchWord.new(@begriff, @sprache)
      finder.get_mp3
      finder.copy_to_clipboard
      finder.copy_message
      `sleep 1` # puts bash for one second two sleep
      puts `clear`# clears bash
    end
  end until @begriff.downcase == "m"
end

# let the app beginn
default_settings 
warm_welcome 
main_menue
loop do
  case @choice 
  when 1
    warm_welcome
    main_menue
  when 2
    select_language 
    main_menue
  when 3
    select_word 
    main_menue
  when 4
    break
  end
end

