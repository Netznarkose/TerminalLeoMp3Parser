# To Do: rescue exception implementieren http://www.tutorialspoint.com/ruby/ruby_exceptions.htm
require 'rubygems'
require 'nokogiri'   
require 'open-uri'
require 'Clipboard'
require 'colorize'

def ansage_1 data
  puts
  puts  'Leo-Mp3 Finder'
  puts  '----------------------------------'
  puts
  puts  'Bisherige Vokabeln'
  puts
  puts data
  puts
  puts
  puts  'Sprachen'
  puts  "----------------------------------"
  puts  'english = e'
  puts  'spanish = s'
  puts  'french = f'
  puts
  puts  'exit = x'
  puts
end
def ansage_2 
  puts
	puts 'Which word/ expression? => exit = x'
	puts ""
end

array = []

loop do
ansage_1 array
sprache = gets.chomp!
break if sprache == "x"
ansage_2
begriff = gets.chomp!
array.push begriff
break if begriff == "x"
begriff.gsub!(' ', '%20') # Leerzeichen in der Eingabe werden mit "%20" ausgetauscht weil Leo das so möchte!	
file = open("file_url_en", "r"); url_en = file.read
puts url_en 
url_es = "http://dict.leo.org/dictQuery/m-vocab/esde/query.xml?tolerMode=nof&lp=esde&lang=de&rmWords=off&rmSearch=on&directN=0&search=#{begriff}&searchLoc=0&resultOrder=basic&multiwordShowSingle=on&sectLenMax=16" 
	

	url_fr = "http://dict.leo.org/dictQuery/m-vocab/frde/query.xml?tolerMode=nof&lp=frde&lang=de&rmWords=off&rmSearch=on&directN=0&search=#{begriff}&searchLoc=0&resultOrder=basic&multiwordShowSingle=on&sectLenMax=16"

	case
	when sprache == "e"
	url = url_en
	when sprache == "s"
	url = url_es
	when sprache == "f"
	url = url_fr
	end	
	
	data = Nokogiri::XML(open(url)) # Variable aus dem case-test
	variable = data.at_css('pron').first[1]
	$ergebnis = "http://dict.leo.org/media/audio/#{variable}.mp3" #$ergebnis = globale Variable
	puts
	ansage =  "Mp3 was copied to the Clipboard"
	puts ansage.red
	Clipboard.copy $ergebnis 
	puts
	puts
  `sleep 1` # puts bash for one second two sleep
  puts `clear`# clears bash
end


