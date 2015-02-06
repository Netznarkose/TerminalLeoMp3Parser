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

def welcome
  warm_welcome # loads warm_welcome.rb
end

def help
  get_help # loads get_help.rb
end

def prompting 
    puts `clear`# clears bash
    puts  '######  Leo-Mp3 Finder         ###########    Which Word Are You Looking For ######'
    puts  "\n###  Press: e => English   s => Spanish   f => French   h => Help   x => Exit ###"
    puts
    puts "#{lenguage}\n#{register}"
    print "\nword =>  "; @begriff = gets.chomp!
    `sleep 1` 
end
def generate_url
      @array << @begriff
      finder = SearchWord.new(@begriff, @sprache)
      finder.get_mp3
      finder.copy_to_clipboard
      finder.copy_message
      `sleep 1` 
      puts `clear`
end

# let the app beginn
default_settings 
welcome
begin
prompting
if @begriff == "e" || @begriff == "f" || @begriff == "s" 
  @sprache = @begriff
elsif @begriff == "h"
  help
elsif @begriff == "x"
  puts "\nsee you soon!"
  puts
else
 generate_url
end
end until @begriff == "x"
  
  
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

