require 'nokogiri'
require 'open-uri'
require 'rubygems'
require 'Clipboard'
require 'colorize'

class SearchWord
  attr_accessor :language, :term, :url
  def initialize(input_hash = {})
    @term = input_hash[:term] || 'hello'
    @language = input_hash[:language] || 'e'
    @array = []
    @url = ""
  end

  def prompting_menue # header
    puts `clear`
    puts '#' * 6 << ' ' * 6 << 'L E O -- M P 3 -- P A R S E R' << ' ' * 6 << '#' * 6
    print "\nType:  "; language_hash.map {|key, value| print "#{key} => #{value}   " }
  end

  def language_hash
    {
      "e" => "English",
      "s" => "Spanish",
      "f" => "French",
      "exit" => "Exit"
    }
  end

  def prompting_language_display # language menu
    hash = { "e" => "English", "s" => "Spanish", "f" => "French" }
    "\nLanguage is set to: #{ hash[@language] }"
  end

  def prompting_register # vocab-list
    if @array.empty?
      "\nLooked up Vocabulary: No Activity yet"
    else
      @array.map do |items|
        items.gsub!('%20', ' ')
      end
      "\nLooked up Vocabulary: #{@array}"
    end
  end

  def deleting_register
    @array.clear
  end

  def user_input
    print "\nword =>  "; @user_input = gets.chomp!
  end

  private

  def flash_message(data)
    flash = {success: "\nMp3 was copied to the Clipboard", danger: "could not be found"}
    flash[data]
  end
end

