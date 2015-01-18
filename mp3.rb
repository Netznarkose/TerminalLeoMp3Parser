# To Do: rescue exception implementieren http://www.tutorialspoint.com/ruby/ruby_exceptions.htm
require 'rubygems'
require 'nokogiri'   
require 'open-uri'
require 'Clipboard'
require 'colorize'

array = []

loop do

line_width = 40
line_width2 = 67
puts
puts('Leo-Mp3 Finder'.center( line_width))
puts '--------------------------------------------------------------------------------'
puts( 'Sprachen'.ljust( line_width) + 'Bisherige Vokabeln'.rjust( line_width))
array.each do |co| 
puts( co.rjust( line_width2))  
end
puts( 'english = e'.ljust( line_width))
puts( 'spanish = s'.ljust( line_width)) 
puts( 'french = f'.ljust( line_width))
puts
puts( 'exit = x'.ljust( line_width))
	




	
	puts
	sprache = gets.chomp!
break if sprache == "x"
	puts
	puts('Which word/ expression? => exit = x'.center( line_width))
	puts ""
	begriff = gets.chomp!
	array.push "#{begriff}"
break if begriff == "x"
		
        begriff.gsub!(' ', '%20') # Leerzeichen in der Eingabe werden mit "%20" ausgetauscht weil Leo das so möchte!	

	url_en = "http://dict.leo.org/dictQuery/m-vocab/ende/query.xml?tolerMode=nof&lp=ende&lang=en&rmWords=off&rmSearch=on&directN=0&search=#{begriff}&searchLoc=0&resultOrder=basic&multiwordShowSingle=on&sectLenMax=16"        
        
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
`sleep 1`
puts `clear`
end

# To Do: nachgeschlagene Vokabeln in eine Liste, clear

