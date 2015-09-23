require 'rubygems'
require 'nokogiri'
require 'Clipboard'
require 'open-uri'
require 'colorize'

class SearchWord
  def initialize(input_hash = {})
    @begriff = input_hash[:begriff] || 'hello'
    @sprache = input_hash[:sprache] || 'e' 
    @array = []
    @copy_message = ""
    @super_url = ""
  end

  def user_input 
    @user_input = gets.chomp!
    if @user_input == "e" || @user_input == "f" || @user_input == "s" 
      @sprache = @user_input
      puts prompting_menue
      puts prompting_language_display
      puts prompting_register
      user_input    
    else
      @begriff = @user_input 
    end
  end


  def prompting_menue
      puts `clear`# clears bash
      "######  Leo-Mp3 Finder         ###########    Which Word Are You Looking For ###### 
      \n\n###  Press: e => English   s => Spanish   f => French   h => Help   exit => Quitting ###"
  end
  def prompting_language_display
    hash = { "e" => "English", "s" => "Spanish", "f" => "French" }
    "\nLanguage is set to: #{ hash[@sprache] }"
  end

    def prompting_register
      if @array.empty?
      "\nLooked up Vocabulary:" " no Activity yet"#.red
      else
        @array.map do |items|
          items.gsub!('%20', ' ')
        end
        "Looked up Vocabulary: #{@array}"
      end
    end
  
  def get_mp3 
    @array << @begriff
    @begriff.gsub!(' ', '%20') # Leerzeichen in der Eingabe werden mit "%20" ausgetauscht weil Leo das so möchte!  
    url_en = "http://dict.leo.org/dictQuery/m-vocab/ende/query.xml?tolerMode=nof&lp=ende&lang=en&rmWords=off&rmSearch=on&directN=0&search=#{@begriff}&searchLoc=0&resultOrder=basic&multiwordShowSingle=on&sectLenMax=16"             
    url_es = "http://dict.leo.org/dictQuery/m-vocab/esde/query.xml?tolerMode=nof&lp=esde&lang=de&rmWords=off&rmSearch=on&directN=0&search=#{@begriff}&searchLoc=0&resultOrder=basic&multiwordShowSingle=on&sectLenMax=16"
    url_fr = "http://dict.leo.org/dictQuery/m-vocab/frde/query.xml?tolerMode=nof&lp=frde&lang=de&rmWords=off&rmSearch=on&directN=0&search=#{@begriff}&searchLoc=0&resultOrder=basic&multiwordShowSingle=on&sectLenMax=16"
    case
    when @sprache == "e" #refactor
      @url = url_en
    when @sprache == "s"
      @url = url_es
    when @sprache == "f"
      @url = url_fr
    end	
    noko = Nokogiri::XML(open(@url)) # Variable aus dem case-test
    @super_url = noko.at_css('pron').first[1]
  end
 
  def copy_to_clipboard
    Clipboard.copy "http://dict.leo.org/media/audio/#{@super_url}.mp3"
  end
 
  def copy_message
    @copy_message =  "\nMp3 was copied to the Clipboard".red # test if copy clipboard sucsessfully
    puts @copy_message
  end
end

