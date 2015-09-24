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
    @url = ""
  end
  
  def generate_url
    select_sprache = { 'e' => 'ende', 's' => 'esde', 'f' => 'frde' }

   @url = "http://dict.leo.org/dictQuery/m-vocab/" << select_sprache[@sprache]
   @url << "/query.xml?tolerMode=nof&lp=ende&lang=en&rmWords=off&rmSearch=on&directN=0&search=" 
   @url << @begriff 
   @url << "&searchLoc=0&resultOrder=basic&multiwordShowSingle=on&sectLenMax=16"
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
  
  def begriff_to_register
    # copy begriff to register
    # @array << @begriff
    
  end

  def get_mp3 
    generate_url
    begin
      noko = Nokogiri::XML(open(@url)) # Variable aus dem case-test
      rescue
        flash_message(:danger)
      else
        flash_message(:success)
        final_url = noko.at_css('pron').first[1]
        "http://dict.leo.org/media/audio/#{final_url}.mp3"
    end
  end
 
  def flash_message(data) 
    flash = {success: '\nMp3 was copied to the Clipboard', danger: 'could not be found'}
    flash[data]
  end
end

