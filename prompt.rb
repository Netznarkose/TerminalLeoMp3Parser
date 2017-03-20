require 'pry-byebug'

class Prompt
  attr_accessor :vocabulary
  def initialize
    @vocabulary = []
  end

  def header
    puts '#' * 6 << ' ' * 6 << 'L E O -- M P 3 -- P A R S E R' << ' ' * 6 << '#' * 6 # use format
    print "\nType:  exit => Exit   "; language_hash.map { |key, value| print "#{key} => #{value}   " }
  end

  def language_hash
    {
      'e'    => 'English',
      's'    => 'Spanish',
      'f'    => 'French'
    }
  end

  def selected_language(language)
    "\nLanguage is set to: #{language_hash[language]}"
  end

  def vocab_list
    "\nLooked up Vocabulary: %s" % (@vocabulary.any? ? @vocabulary : 'No Activity yet').to_s
  end

  def clear_vocab_list
    @vocabulary.clear
  end
end
