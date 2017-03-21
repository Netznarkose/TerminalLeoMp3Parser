require_relative './prompt.rb'
require_relative './vocab.rb'
require 'leo_mp3_parser'
require 'Clipboard'
require 'colorize'
include NavBar

def prompt_user
  print "\nword =>  "; gets.chomp!
end

def clear
  puts `clear`
end

def instantiate_leo_mp3_parser
  LeoMp3Parser.new
end

def instantiate_vocab
  Vocab.new
end

def leo_mp3_dictionary # better naming
  {
    'e'    => 'ende',
    's'    => 'esde',
    'f'    => 'frde'
  }
end

def translate_params(language_and_term) # better naming
  { language: leo_mp3_dictionary[language_and_term[:language]], term: language_and_term[:term] }
end

def sleep
  puts `sleep 2`
end

def copy_to_clipboard(content)
  Clipboard.copy(content)
end

leo_mp3_parser = instantiate_leo_mp3_parser
vocab = instantiate_vocab
loop do
  begin
    clear
    language_and_term ||= { language: 'e', term: 'hello' }
    puts header
    puts selected_language(language_and_term[:language])
    puts vocab_list(vocab.list)
    answer_user = prompt_user
    language_and_term[:language] = answer_user if language_hash.key?(answer_user)
  end while language_hash.key?(answer_user)
  break if answer_user == 'exit'
  language_and_term[:term] = answer_user
  if language_and_term[:term] == 'clear'
    vocab.list.clear
  else
    copy_to_clipboard(leo_mp3_parser.get_audio_url(translate_params(language_and_term)))
    # file not found case !!!
    puts messages(:success)
    sleep
    vocab.list += [language_and_term[:term]]
  end
end
