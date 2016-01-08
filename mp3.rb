# To Do: rescue exception implementieren http://www.tutorialspoint.com/ruby/ruby_exceptions.htm
require_relative 'warm_welcome.rb'
require_relative 'get_help.rb'
require_relative "./process_url.rb"


# let the app beginn

# warm_welcome #uncomment for a nice app-intro
global = SearchWord.new
begin
  begin
    puts global.prompting_menue
    puts global.prompting_language_display
    puts global.prompting_register
    user_input = global.user_input
    if  user_input == "e" || user_input == "f" || user_input == "s" 
      global.language = user_input
    elsif user_input == 'exit'
      puts 'see you'
    elsif user_input == 'help'
      get_help
    elsif user_input == 'clear'
      global.deleting_register
    else
      global.term = user_input
      puts global.get_mp3
      puts `sleep 2`
    end
  end while user_input == "e" || user_input == "f" || user_input == "s" 
end until user_input == 'exit'
  


         

