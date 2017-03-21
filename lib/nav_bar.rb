module NavBar

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

  def looked_up_vocab(vocabulary)
    "\nLooked up Vocabulary: %s" % (vocabulary.any? ? vocabulary : 'No Activity yet').to_s
  end

  def messages(type)
    if type == :success
      "\n URL to Audiofile was copied to Clipboard".red
    else
      ""
    end
  end
end
