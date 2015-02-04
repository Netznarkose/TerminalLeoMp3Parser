# To Do: rescue exception implementieren http://www.tutorialspoint.com/ruby/ruby_exceptions.htm
require 'rubygems'
require 'nokogiri'   
require 'open-uri'
require 'Clipboard'
require 'colorize'


# Methods

def warm_welcome data
  puts  '##################################'.green
  puts  '#                                #'.green
  puts  '#                                #'.green
  puts  '#       Leo-Mp3 Finder           #'.green
  puts  '#                                #'.green
  puts  '##################################'.green
  puts
  puts  
  puts 
  puts
  puts
  `sleep 3` # puts bash for one second two sleep
  puts `clear`# clears bash

end
def select_language 
  begin
  puts  'Sprachen'
  puts  "----------------------------------"
  puts  'english = e'
  puts  'spanish = s'
  puts  'french = f'
  puts
  puts  'exit = x'
  puts
  @sprache = gets.chomp!
  puts `clear`# clears bash
  end until @sprache == "e" || @sprache == "s" || @sprache == "f"
end
def select_word 
  puts
	puts 'Which word/ expression? => exit = x'
	puts ""
  @begriff = gets.chomp!
end
def process_url
  @begriff.gsub!(' ', '%20') # Leerzeichen in der Eingabe werden mit "%20" ausgetauscht weil Leo das so möchte!  
  url_en = "http://dict.leo.org/dictQuery/m-vocab/ende/query.xml?tolerMode=nof&lp=ende&lang=en&rmWords=off&rmSearch=on&directN=0&search=#{@begriff}&searchLoc=0&resultOrder=basic&multiwordShowSingle=on&sectLenMax=16"             
  url_es = "http://dict.leo.org/dictQuery/m-vocab/esde/query.xml?tolerMode=nof&lp=esde&lang=de&rmWords=off&rmSearch=on&directN=0&search=#{@begriff}&searchLoc=0&resultOrder=basic&multiwordShowSingle=on&sectLenMax=16"
  url_fr = "http://dict.leo.org/dictQuery/m-vocab/frde/query.xml?tolerMode=nof&lp=frde&lang=de&rmWords=off&rmSearch=on&directN=0&search=#{@begriff}&searchLoc=0&resultOrder=basic&multiwordShowSingle=on&sectLenMax=16"
  case
	when @sprache == "e"
	  @url = url_en
	when @sprache == "s"
	  @url = url_es
	when @sprache == "f"
	  @url = url_fr
	end	
end

def default_settings
  @sprache = "e"
end

def main_menue(data, sparta)
    
puts  '                   Leo-Mp3 Finder           '
puts  "                   main menue".red
puts
puts  "lenguage is set to: #{data[@sprache].red}"
sparta = "no entrys yet".red if sparta.empty?
puts  "Bisherige Vokabeln: #{sparta}"
puts
puts  "1 = welcome 2 = change language 3 = select word 4 = break"
@choice = gets.chomp!.to_i 
return @choice # wahrscheinlich redundant
end

# let the app beginn
array = []
hash = { "e" => "english", "s" => "spanish", "f" => "french" }
default_settings
warm_welcome array
main_menue(hash, array)
loop do
  case @choice 
  when 1
    warm_welcome array
    main_menue(hash, array)
  when 2
    select_language 
    main_menue(hash, array)
  when 3
    select_word
  when 4
    break
  end
end
#
#array.push @begriff
#break if @begriff == "x"
#process_url 
#
#	data = Nokogiri::XML(open(@url)) # Variable aus dem case-test
#	variable = data.at_css('pron').first[1]
#	Clipboard.copy "http://dict.leo.org/media/audio/#{variable}.mp3"
#	puts
#	puts "Mp3 was copied to the Clipboard".red
#	puts
#	puts
#  `sleep 1` # puts bash for one second two sleep
#  puts `clear`# clears bash
#end
#
#
