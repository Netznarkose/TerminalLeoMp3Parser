require 'nokogiri'
require 'open-uri'
require 'rubygems'
require 'Clipboard'
require 'colorize'

class SearchWord
  attr_accessor :sprache, :begriff, :url
  def initialize(input_hash = {})
    @term = input_hash[:begriff] || 'hello'
    @language = input_hash[:sprache] || 'e' 
    @array = []
    @url = ""
  end
  
  def prompting_menue
      puts `clear`# clears bash
      "######  Leo-Mp3 Finder         ###########    Which Word Are You Looking For ###### 
      \n\n###  Press: e => English   s => Spanish   f => French   h => Help   exit => Quitting ###"
  end

  def prompting_language_display
    hash = { "e" => "English", "s" => "Spanish", "f" => "French" }
    "\nLanguage is set to: #{ hash[@language].red }"
  end
  
  def prompting_register
    if @array.empty?
      print "\nLooked up Vocabulary:"; " no Activity yet".red
    else
      @array.map do |items|
        items.gsub!('%20', ' ')
      end
      "Looked up Vocabulary: #{@array}"
    end
  end

  def user_input 
    print "\nword =>  "; @user_input = gets.chomp!
  end
  
  def get_mp3 
    generate_url
    begin
      noko = Nokogiri::XML(open(@url)) # Variable aus dem case-test
      final_url = noko.at_css('pron').first[1]
    rescue
      @array.push "####{@term}"
      flash_message(:danger)
    else
      @array.push @term
      Clipboard.copy "http://dict.leo.org/media/audio/#{final_url}.mp3"
      flash_message(:success)
    end
  end
  
  def flash_message(data) 
    flash = {success: "\nMp3 was copied to the Clipboard", danger: "could not be found"}
    flash[data]
  end
private

  def generate_url
    select_language = { 'e' => 'ende', 's' => 'esde', 'f' => 'frde' }
    @url = "http://dict.leo.org/dictQuery/m-vocab/" << select_language[@language]
    @url << "/query.xml?tolerMode=nof&lp=ende&lang=en&rmWords=off&rmSearch=on&directN=0&search=" 
    @url << @term 
    @url << "&searchLoc=0&resultOrder=basic&multiwordShowSingle=on&sectLenMax=16"
  end

end

