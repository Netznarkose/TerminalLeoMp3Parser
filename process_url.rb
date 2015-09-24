require 'rubygems'
require 'nokogiri'
require 'Clipboard'
require 'open-uri'
require 'colorize'

class SearchWord
  attr_accessor :sprache, :begriff, :url
  def initialize(input_hash = {})
    @begriff = input_hash[:begriff] || 'hello'
    @sprache = input_hash[:sprache] || 'e' 
    @array = []
    @copy_message = ""
    @super_url = ""
    @url = { 'e' => "http://dict.leo.org/dictQuery/m-vocab/ende/query.xml?tolerMode=nof&lp=ende&lang=en&rmWords=off&rmSearch=on&directN=0&search=#{@begriff.gsub!(' ', '%20')}&searchLoc=0&resultOrder=basic&multiwordShowSingle=on&sectLenMax=16",
             'f' => "http://dict.leo.org/dictQuery/m-vocab/esde/query.xml?tolerMode=nof&lp=esde&lang=de&rmWords=off&rmSearch=on&directN=0&search=#{@begriff.gsub!(' ', '%20')}&searchLoc=0&resultOrder=basic&multiwordShowSingle=on&sectLenMax=16",
             's' => "http://dict.leo.org/dictQuery/m-vocab/frde/query.xml?tolerMode=nof&lp=frde&lang=de&rmWords=off&rmSearch=on&directN=0&search=#{@begriff.gsub!(' ', '%20')}&searchLoc=0&resultOrder=basic&multiwordShowSingle=on&sectLenMax=16"
            }
  end

  def user_input 
    @user_input = gets.chomp!
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
    # copy begriff to register
    # @array << @begriff
    
    # put begriff to url
    # replace whitespace
    # @begriff.gsub!(' ', '%20') 
  end

  def generate_nokogiri_object
    begin
      noko = Nokogiri::XML(open(@url[@sprache])) # Variable aus dem case-test
      rescue
        flash_message(:danger)
      else
        # generate_final_url
        flash_message(:success)
    end
  end
  def generate_final_url
    @super_url = noko.at_css('pron').first[1]
  end
 
  def copy_to_clipboard
    Clipboard.copy "http://dict.leo.org/media/audio/#{@super_url}.mp3"
  end
 
  def flash_message(data) 
    flash = {success: '\nMp3 was copied to the Clipboard', danger: 'could not be found'}
    flash[data]
  end
end

