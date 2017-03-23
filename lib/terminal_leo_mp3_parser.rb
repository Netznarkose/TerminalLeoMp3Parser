require_relative './nav_bar.rb'
require_relative './vocab.rb'
require_relative './operations.rb'
require 'leo_mp3_parser'
require 'Clipboard'
require 'colorize'
include NavBar
include Operations


leo_mp3_parser = instantiate_leo_mp3_parser
vocab = instantiate_vocab
loop do
  begin
    clear
    language_and_term ||= { language: 'e', term: 'hello' }
    puts header
    puts selected_language(language_and_term[:language])
    puts looked_up_vocab(vocab.list)
    answer_user = prompt_user
    language_and_term[:language] = answer_user if language_hash.key?(answer_user)
  end while language_hash.key?(answer_user)
  break if answer_user == 'exit'
  language_and_term[:term] = answer_user
  if language_and_term[:term] == 'clear'
    vocab.list.clear
  else
    begin
      copy_to_clipboard(leo_mp3_parser.get_audio_url(leo_mp3_parser_argument_adapter(language_and_term)))
      vocab.list += [language_and_term[:term]]
      puts notification(:success); puts `sleep 2`
    rescue
      puts notification(:failed); puts `sleep 2`
    end
  end
end
