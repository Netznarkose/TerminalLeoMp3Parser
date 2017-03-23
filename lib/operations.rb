module Operations
  def prompt_user
    print "\nTerm =>  "; gets.chomp!
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

  def leo_mp3_parser_language_conversion
    {
      'e'    => 'ende',
      's'    => 'esde',
      'f'    => 'frde'
    }
  end

  def leo_mp3_parser_argument_adapter(language_and_term)
    { language: leo_mp3_parser_language_conversion[language_and_term[:language]], term: language_and_term[:term] }
  end

  def copy_to_clipboard(url)
    Clipboard.copy(url)
  end
end
