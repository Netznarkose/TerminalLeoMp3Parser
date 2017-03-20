require 'pry-byebug'
require 'leo_mp3_parser'
require_relative './prompt.rb'
require 'Clipboard'
require 'colorize'

def prompt_user
  print "\nword =>  "; gets.chomp!
end

def clear
  puts `clear`
end

def instantiate_prompt
  Prompt.new
end

def instantiate_leo_mp3_parser
  LeoMp3Parser.new
end

def leo_mp3_dictionary
  {
    'e'    => 'ende',
    's'    => 'esde',
    'f'    => 'frde'
  }
end

def translate_params(language_and_term)
  { language: leo_mp3_dictionary[language_and_term[:language]], term: language_and_term[:term] }
end

def sleep
  puts `sleep 2`
end
prompt = instantiate_prompt
leo_mp3_parser = instantiate_leo_mp3_parser
begin
  begin
    clear
    language_and_term ||= { language: 'e', term: 'hello' }
    puts prompt.header
    puts prompt.selected_language(language_and_term[:language])
    puts prompt.vocab_list
    answer_user = prompt_user
    language_and_term[:language] = answer_user if prompt.language_hash.key?(answer_user)
  end while prompt.language_hash.key?(answer_user)
  language_and_term[:term] = answer_user
  if language_and_term[:term] == 'clear'
    prompt.clear_vocab_list
  else
    Clipboard.copy leo_mp3_parser.get_audio_url(translate_params(language_and_term))
    puts "\nURL to Audiofile was copied to the Clipboard".red
    sleep
    prompt.vocabulary += [language_and_term[:term]]
  end
end until language_and_term[:term] == 'exit'
