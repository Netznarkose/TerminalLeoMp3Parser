require 'rubygems'
require 'nokogiri'
require 'Clipboard'
require 'open-uri'
require 'colorize'

class SearchWord
  def initialize(begriff, language)
    @begriff = begriff
    @sprache = language
    @array = []
    @copy_message = ""
    @super_url = ""
  end
 
  def copy_message
    @copy_message =  "Mp3 was copied to the Clipboard".red # test if copy clipboard sucsessfully
    puts @copy_message
  end
  def copy_to_clipboard
    Clipboard.copy "http://dict.leo.org/media/audio/#{@super_url}.mp3"
  end

  def get_mp3 
    @array << @begriff
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
    @super_url = noko.at_css('pron').first[1]
  end
end

