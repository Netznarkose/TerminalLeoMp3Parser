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

def select_word 
  begin
    puts `clear`# clears bash
    puts  '######  Leo-Mp3 Finder #######  Search a Word #######'
    puts  "\nWhich Word Are You Looking For "
    puts  "\nPress: e for: English s for: Spanish f for: French x for: Exiting"
    puts
    puts "#{lenguage}\n#{register}"
    print "\nword =>  "; @begriff = gets.chomp!
    if @begriff != "e" && @begriff != "f" && @begriff != "s"
      @array << @begriff
      finder = SearchWord.new(@begriff, @sprache)
      finder.get_mp3
      finder.copy_to_clipboard
      finder.copy_message
      `sleep 1` 
      puts `clear`
    elsif @begriff == "e" || @begriff == "f" || @begriff == "s"
      @sprache = @begriff
    end
  end until @begriff == "x"
end

# let the app beginn
default_settings 
warm_welcome 
select_word
#loop do
#  case @choice 
#  when 1
#    warm_welcome
#    main_menue
#  when 2
#    select_language 
#    main_menue
#  when 3
#    select_word 
#    main_menue
#  when 4
#    break
#  end
#end

