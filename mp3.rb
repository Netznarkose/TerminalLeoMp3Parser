# To Do: rescue exception implementieren http://www.tutorialspoint.com/ruby/ruby_exceptions.htm
# require_relative 'warm_welcome.rb'
# require_relative 'get_help.rb'
load "./process_url.rb"

# Methods
# class Mp3
#   def default_settings 
#     @sprache = "e"
#     @array = []
#   end

#   def language
#     @hash = { "e" => "English", "s" => "Spanish", "f" => "French" }
#     "Language is set to: #{ @hash[@sprache] }"
#   end

#   def register
#     if @array.empty?
#     print "\nLooked up Vocabulary:"; print " no Activity yet".red
#     else
#       @array.map do |items|
#         items.gsub!('%20', ' ')
#       end
#       "Looked up Vocabulary: #{@array}"
#     end
#   end

#   def welcome
#     warm_welcome # loads warm_welcome.rb
#   end

#   def help
#     get_help # loads get_help.rb
#   end

#   def prompting 
#       puts `clear`# clears bash
#       puts  '######  Leo-Mp3 Finder         ###########    Which Word Are You Looking For ######'
#       puts  "\n###  Press: e => English   s => Spanish   f => French   h => Help   exit => Quitting ###"
#       puts
#       puts "#{language}\n#{register}"
#       # print "\nword =>  "; @begriff = gets.chomp!
#       `sleep 1` 
#   end
#   def process_url # loads the SeachWord class from process_url.rb
#         @finder = SearchWord.new(@begriff, @sprache)
#         @finder.get_mp3
#         @finder.copy_to_clipboard
#         @finder.copy_message
#         puts `clear`
#   end
# end

# let the app beginn
global = SearchWord.new
global.prompting
puts global.language_board
global.user_input
global.get_mp3
global.copy_to_clipboard
global.copy_message
# default_settings 
# # welcome
# begin
# prompting
# if @begriff == "e" || @begriff == "f" || @begriff == "s" 
#   @sprache = @begriff
# elsif @begriff == "h"
#   help
# elsif @begriff == "exit"
#   puts "\nsee you soon!"
#   puts
# else
#   begin
#     process_url
#     if @finder
#       @array << @begriff
#     end
#   rescue
#     puts "\nWARNING: Word Not Found".red
#     `sleep 1`
#     puts "\nTry Again!".red
#     `sleep 1`
#     @array << "#{@begriff} <--- could not be found"
#   end
# end
# end until @begriff == "exit"
