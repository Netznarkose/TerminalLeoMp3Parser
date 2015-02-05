# To Do: rescue exception implementieren http://www.tutorialspoint.com/ruby/ruby_exceptions.htm
require 'rubygems'
require 'nokogiri'   
require 'open-uri'
require 'Clipboard'
require 'colorize'


# Methods

def default_settings 
  @sprache = "e"
end

def lenguage
  @hash = { "e" => "english", "s" => "spanish", "f" => "french" }
  puts  "lenguage is set to: #{@hash[@sprache].red}"
end

def register
  @array = []
  @array = "no entrys yet".red if @array.empty?
  puts  "Bisherige Vokabeln: #{@array}"
end

def warm_welcome 
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
  `sleep 1` # puts bash for one second two sleep
  puts `clear`# clears bash
end

def main_menue
puts `clear`# clears bash
puts  '   ######  Leo-Mp3 Finder #######  Main Meue #######'
puts
puts  "Press: 1 for: Welcome 2 for: Changing Languages 3 for:  Searching a Word 4 for: Exiting"
puts
lenguage
register
puts
@choice = gets.chomp!.to_i 
return @choice # wahrscheinlich redundant
end

def select_language 
begin
puts `clear`# clears bash
puts  '   ######  Leo-Mp3 Finder #######  Select Language  #######'
puts  
puts  "Press: e for: English s for: Spanish f for: French 4 for: Exiting"
puts
lenguage
register
puts
@sprache = gets.chomp!
puts `clear`# clears bash
end until @sprache == "e" || @sprache == "s" || @sprache == "f"
end
def select_word 
puts `clear`# clears bash
puts  '    ######  Leo-Mp3 Finder #######  Search a Word #######'
puts 
puts "Which Word Are You Looking For ? #### Press => m for Main Menue #####"
puts
lenguage
register
puts
puts
print "word =>  "; @begriff = gets.chomp!
main_menue if @begriff == "m"
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
	noko = Nokogiri::XML(open(@url)) # Variable aus dem case-test
	variable = noko.at_css('pron').first[1]
	Clipboard.copy "http://dict.leo.org/media/audio/#{variable}.mp3"
	puts
	puts "Mp3 was copied to the Clipboard".red
	puts
	puts
  `sleep 1` # puts bash for one second two sleep
  puts `clear`# clears bash
end

# let the app beginn
default_settings 
warm_welcome 
main_menue
loop do
  case @choice 
  when 1
    warm_welcome array
    main_menue
  when 2
    select_language 
    main_menue
  when 3
    select_word 
  when 4
    break
  end
end

